//
//  ViewController.swift
//  MiniAudioPlayer
//
//  Created by BHJ on 2022/06/25.
//

import UIKit
import MarqueeLabel

class ViewController: UIViewController {

    @IBOutlet weak var demoLabel: MarqueeLabel!

    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var next15Button: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
        setUI()
    }
    
    fileprivate func setUI() {
        demoLabel.text = " 2022년 06월28일 (화) 뉴스룸 "
        demoLabel.type = .continuous
        demoLabel.speed = .duration(7.0)
        demoLabel.fadeLength = 10.0
        demoLabel.trailingBuffer = 30.0
    }

}

