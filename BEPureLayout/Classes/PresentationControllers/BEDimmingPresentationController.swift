//
//  BEDimmingPresentationController.swift
//  BEPureLayout
//
//  Created by Chung Tran on 15/04/2021.
//

import Foundation

open class BEDimmingPresentationController: UIPresentationController {
    // MARK: - Properties
    private lazy var dimmingView: UIView = {
        let dimmingView = UIView(backgroundColor: .init(white: 0, alpha: 0.5))
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        dimmingView.addGestureRecognizer(recognizer)
        return dimmingView
    }()
    
    // MARK: - Transition
    open override func presentationTransitionWillBegin() {
        guard let containerView = containerView else {return}
        // add dimmingView
        containerView.insertSubview(dimmingView, at: 0)
        dimmingView.autoPinEdgesToSuperviewEdges()
        
        // animate dimmingViewIn
        dimmingView.alpha = 0
        presentingViewController.transitionCoordinator?.animate(
            alongsideTransition: { _ in
                self.dimmingView.alpha = 1
            },
            completion: nil
        )
    }
    
    open override func presentationTransitionDidEnd(_ completed: Bool) {
        // Remove views if transition was aborted.
        //
        // If transition completed normally, nothing to do.
        if !completed {
            dimmingView.removeFromSuperview()
        }
    }
    
    // MARK: - Dismissal transition
    open override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        presentingViewController.transitionCoordinator?.animate(
            alongsideTransition: { _ in
                self.dimmingView.alpha = 0
            },
            completion: nil
        )
    }
    
    open override func dismissalTransitionDidEnd(_ completed: Bool) {
        // Remove views if transition was aborted.
        //
        // If transition completed normally, nothing to do.
        if !completed {
            dimmingView.removeFromSuperview()
        }
    }
    
    // MARK: - Actions
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true)
    }
}
