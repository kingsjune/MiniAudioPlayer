//
//  TransitionAnimation.swift
//  MiniAudioPlayer
//
//  Created by bhj on 2022/06/30.
//

import Foundation
import UIKit
import ARNTransitionAnimator

final class MPTransitionAnimation: TransitionAnimatable{
    
//    func sourceVC() -> UIViewController {
//
//    }
//
//    func destVC() -> UIViewController {
//
//    }
//
//    func willAnimation(_ transitionType: TransitionType, containerView: UIView) {
//
//    }
//
//    func updateAnimation(_ transitionType: TransitionType, percentComplete: CGFloat) {
//
//    }
//
//    func finishAnimation(_ transitionType: TransitionType, didComplete: Bool) {
//
//    }
    
    fileprivate weak var rootVC: ViewController!
    fileprivate weak var detailVC: DetailViewController!
    
    var completion: ((Bool) -> Void)?
    
    private var miniPlayerStartFrame: CGRect = CGRect.zero
    private var tabBarStartFrame: CGRect = CGRect.zero
    
    private var containerView: UIView?
    
    deinit {
        print("deinit MPTransitionAnimation")
    }
    
    init(rootVC: ViewController, detailVC: DetailViewController) {
        self.rootVC = rootVC
        self.detailVC = detailVC
    }
    
    func prepareContainer(_ transitionType: TransitionType, containerView: UIView, from fromVC: UIViewController, to toVC: UIViewController) {
        self.containerView = containerView
        if transitionType.isPresenting {
            self.rootVC.view.insertSubview(self.detailVC.view, belowSubview: self.rootVC.bottomView)
        } else {
            self.rootVC.view.insertSubview(self.detailVC.view,  belowSubview: self.rootVC.bottomView)
        }
        self.rootVC.view.setNeedsLayout()
        self.rootVC.view.layoutIfNeeded()
        self.detailVC.view.setNeedsLayout()
        self.detailVC.view.layoutIfNeeded()
    
        self.miniPlayerStartFrame = self.rootVC.bottomView.frame
    }
    
    func willAnimation(_ transitionType: TransitionType, containerView: UIView) {
        
    }
}
