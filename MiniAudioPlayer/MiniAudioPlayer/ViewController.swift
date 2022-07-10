//
//  ViewController.swift
//  MiniAudioPlayer
//
//  Created by BHJ on 2022/06/25.
//

import UIKit
import MarqueeLabel
import ARNTransitionAnimator

class ViewController: UIViewController {

    @IBOutlet weak var demoLabel: MarqueeLabel!

    fileprivate var detailVC: DetailViewController!
    private var animator : ARNTransitionAnimator?

    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var next15Button: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        self.detailVC.modalPresentationStyle = .overCurrentContext
        setUI()
//        setupAnimator()
    }
    
    @IBAction func showDetailAction(_ sender: Any) {
        print("showDetailAction")
        self.present(self.detailVC, animated: true, completion: nil)

    }
    func setupAnimator() {
        let animation = MPTransitionAnimation(rootVC: self, detailVC: self.detailVC)
        animation.completion = { [weak self] isPresenting in
            if isPresenting {
                guard let _self = self else { return }
                let modalGestureHandler = TransitionGestureHandler(targetView: _self.detailVC.view, direction: .bottom)
                modalGestureHandler.panCompletionThreshold = 15.0
                _self.animator?.registerInteractiveTransitioning(.dismiss, gestureHandler: modalGestureHandler)
            } else {
                self?.setupAnimator()
            }
        }
        
        let gestureHandler = TransitionGestureHandler(targetView: self.bottomView, direction: .top)
        gestureHandler.panCompletionThreshold = 15.0
        gestureHandler.panFrameSize = self.view.bounds.size

        self.animator = ARNTransitionAnimator(duration: 0.5, animation: animation)
        self.animator?.registerInteractiveTransitioning(.present, gestureHandler: gestureHandler)
        
        self.detailVC.transitioningDelegate = self.animator
    }
    
    fileprivate func setUI() {
        demoLabel.text = " 2022년 06월28일 (화) 뉴스룸 "
        demoLabel.type = .continuous
        demoLabel.speed = .duration(7.0)
        demoLabel.fadeLength = 10.0
        demoLabel.trailingBuffer = 30.0
    }

}

