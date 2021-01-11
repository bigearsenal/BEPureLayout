//
//  WelcomeVC.swift
//  p2p wallet
//
//  Created by Chung Tran on 10/23/20.
//

import Foundation

public protocol BEPagesVCDelegate: class {
    func bePagesVC(_ pagesVC: BEPagesVC, currentPageDidChangeTo currentPage: Int)
}

open class BEPagesVC: BEViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    // MARK: - Properties
    public var currentPage = 0
    public weak var delegate: BEPagesVCDelegate?
    
    public var viewControllers = [UIViewController]() {
        didSet {
            pageControl.numberOfPages = viewControllers.count
            if currentPage < viewControllers.count {
                pageVC.setViewControllers([viewControllers[currentPage]], direction: .forward, animated: false, completion: nil)
            } else {
                kickOff()
            }
        }
    }
    
    public var pageIndicatorTintColor = UIColor.lightGray {
        didSet {pageControl.pageIndicatorTintColor = pageIndicatorTintColor}
    }
    
    public var currentPageIndicatorTintColor = UIColor.black {
        didSet {pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor}
    }
    
    // MARK: - Subviews
    public lazy var containerView = UIView(forAutoLayout: ())
    public lazy var pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    public lazy var pageControl: UIPageControl = {
        let pc = UIPageControl(forAutoLayout: ())
        pc.addTarget(self, action: #selector(pageControlDidChange), for: .valueChanged)
        return pc
    }()
    
    open override func setUp() {
        super.setUp()
        // containerview
        setUpContainerView()
        
        // add pageVC
        pageVC.dataSource = self
        pageVC.delegate = self
        addChild(pageVC)
        containerView.addSubview(pageVC.view)
        pageVC.didMove(toParent: self)
        
        // add page control
        setUpPageControl()
    }
    
    open func setUpContainerView() {
        view.addSubview(containerView)
        containerView.autoPinEdgesToSuperviewEdges()
    }
    
    open func setUpPageControl() {
        view.addSubview(pageControl)
        pageControl.autoPinEdge(toSuperviewSafeArea: .bottom, withInset: 30)
        pageControl.autoAlignAxis(toSuperviewAxis: .vertical)
    }
    
    // MARK: - Methods
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageVC.view.translatesAutoresizingMaskIntoConstraints = false
        pageVC.view.autoPinEdgesToSuperviewEdges()
        containerView.setNeedsLayout()
    }
    
    private func kickOff() {
        guard viewControllers.count > 0 else {return}
        pageVC.setViewControllers([viewControllers.first!], direction: .forward, animated: true, completion: nil)
        currentPage = 0
        delegate?.bePagesVC(self, currentPageDidChangeTo: 0)
    }
    
    open func moveToPage(_ index: Int) {
        guard index < viewControllers.count, index != currentPage else {return}
        pageVC.setViewControllers([viewControllers[index]], direction: index > currentPage ? .forward: .reverse, animated: true, completion: nil)
        currentPage = index
        pageControl.currentPage = index
    }
    
    open func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController),
            index != 0
        else {return nil}
        return viewControllers[index - 1]
    }
    
    open func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController),
            index < viewControllers.count - 1
        else {return nil}
        return viewControllers[index + 1]
    }
    
    open func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let vc = pageVC.viewControllers?.first,
           let index = viewControllers.firstIndex(of: vc)
        {
            pageControl.currentPage = index
            currentPage = index
            delegate?.bePagesVC(self, currentPageDidChangeTo: index)
        }
    }
    
    // MARK: - Actions
    @objc func pageControlDidChange() {
        moveToPage(pageControl.currentPage)
    }
}
