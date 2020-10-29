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
    var currentPage = 0
    public weak var delegate: BEPagesVCDelegate?
    
    public var viewControllers = [BEPageVCType]() {
        didSet {
            pageControl.numberOfPages = viewControllers.count
            kickOff()
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
    lazy var pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    public lazy var pageControl = UIPageControl(forAutoLayout: ())
    
    open override func setUp() {
        super.setUp()
        // containerview
        setUpContainerView()
        
        // add pageVC
        pageVC.dataSource = self
        pageVC.delegate = self
        addChildViewController(pageVC)
        containerView.addSubview(pageVC.view)
        pageVC.didMove(toParentViewController: self)
        
        // add page control
        setUpPageControl()
    }
    
    func setUpContainerView() {
        view.addSubview(containerView)
        containerView.autoPinEdgesToSuperviewEdges()
    }
    
    func setUpPageControl() {
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
    
    open func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? BEPageVCType,
            vc.index != 0
        else {return nil}
        return viewControllers[vc.index - 1]
    }
    
    open func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? BEPageVCType,
            vc.index < viewControllers.count - 1
        else {return nil}
        return viewControllers[vc.index + 1]
    }
    
    open func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let vc = pageVC.viewControllers?.first as? BEPageVCType {
            let index = vc.index
            pageControl.currentPage = index
            currentPage = index
            delegate?.bePagesVC(self, currentPageDidChangeTo: index)
        }
    }
}
