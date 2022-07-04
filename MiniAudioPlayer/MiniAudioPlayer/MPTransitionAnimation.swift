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
        if transitionType.isPresenting {
            self.rootVC.beginAppearanceTransition(true, animated: false)
            
            self.detailVC.view.frame.origin.y = self.rootVC.bottomView.frame.origin.y +
                self.rootVC.bottomView.frame.size.height
        } else {
            self.rootVC.beginAppearanceTransition(false, animated: false)
            
            self.rootVC.bottomView.alpha = 1.0
            self.rootVC.bottomView.frame.origin.y = -self.rootVC.bottomView.bounds.size.height
            self.rootVC.tabBarController!.tabBar.frame.origin.y = containerView.bounds.self.height
        }
    }
    
    func updateAnimation(_ transitionType: TransitionType, percentComplete: CGFloat) {
        if transitionType.isPresenting {
            // 미니플레이어뷰
            let startOriginY = self.miniPlayerStartFrame.origin.y
            let endOriginY = -self.miniPlayerStartFrame.size.height
            let diff = -endOriginY + startOriginY
            // tabBar
            let tabStartOriginY = self.tabBarStartFrame.origin.y
            let tabEndOriginY = self.detailVC.view.frame.self.height
            let tabDiff = tabEndOriginY - tabStartOriginY
            
            let playerY = startOriginY - (diff * percentComplete)
            self.rootVC.bottomView.frame.origin.y = max(min(playerY, self.miniPlayerStartFrame.origin.y), endOriginY)
            
            self.detailVC.view.frame.origin.y = self.rootVC.bottomView.frame.origin.y + self.rootVC.bottomView.frame.size.height
            let tabY = tabStartOriginY + (tabDiff * percentComplete)
            self.rootVC.tabBarController!.tabBar.frame.origin.y = min(max(tabY, self.tabBarStartFrame.origin.y), tabEndOriginY)
            
            let alpha = 1.0 - (1.0 * percentComplete)
            self.rootVC.view.subviews.forEach{ $0.alpha = alpha + 0.4 }
            self.rootVC.tabBarController!.tabBar.alpha = alpha
        } else {
            
            let startOriginY = 0 - self.rootVC.bottomView.bounds.size.height
            let endOriginY = self.miniPlayerStartFrame.origin.y
            let diff = -startOriginY + endOriginY
            // tabBar
            let tabStartOriginY = self.rootVC.view.bounds.size.height
            let tabEndOriginY = self.tabBarStartFrame.origin.y
            let tabDiff = tabStartOriginY - tabEndOriginY
            
            self.rootVC.bottomView.frame.origin.y = startOriginY + (diff * percentComplete)
            self.detailVC.view.frame.origin.y = self.rootVC.bottomView.frame.origin.y + self.rootVC.bottomView.frame.size.height
            
            self.rootVC.tabBarController!.tabBar.frame.origin.y = tabStartOriginY - (tabDiff * (1.0 - percentComplete))
            
            let alpha = 1.0 * percentComplete
            self.rootVC.view.subviews.forEach { $0.alpha = alpha + 0.4 }
            self.rootVC.tabBarController!.tabBar.alpha = alpha
        }
    }
    
    func finishAnimation(_ transitionType: TransitionType, didComplete: Bool) {
        self.rootVC.endAppearanceTransition()
        
        if transitionType.isPresenting {
            if didComplete {
                self.rootVC.bottomView.alpha = 0.0
                self.detailVC.view.removeFromSuperview()
                self.containerView?.addSubview(self.detailVC.view)
                
                self.completion?(transitionType.isPresenting)
            } else {
                self.rootVC.beginAppearanceTransition(true, animated: false)
                self.rootVC.endAppearanceTransition()
            }
        } else {
            if didComplete {
                self.detailVC.view.removeFromSuperview()
                
                self.completion?(transitionType.isPresenting)
            } else {
                self.rootVC.bottomView.alpha = 0.0
                
                self.detailVC.view.removeFromSuperview()
                self.containerView?.addSubview(self.detailVC.view)
                
                self.rootVC.beginAppearanceTransition(false, animated: false)
                self.rootVC.endAppearanceTransition()
            }
        }
    }
}
extension MPTransitionAnimation {
    func sourceVC() -> UIViewController { return self.rootVC }
    
    func destVC() -> UIViewController { return self.detailVC }
}
