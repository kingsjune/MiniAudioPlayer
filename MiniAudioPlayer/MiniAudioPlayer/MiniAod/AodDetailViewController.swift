//
//  AODDetailVC.swift
//  MiniAudioPlayer
//
//  Created by bhj on 2022/07/05.
//

import UIKit

class AodDetailViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var aodTitle: UILabel!
    @IBOutlet var bgView: UIView!
    @IBOutlet weak var detailImgView: UIImageView!
    
    @IBOutlet weak var midTitle: UILabel!
    @IBOutlet weak var bottomTitle: UILabel!
    
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    
    @IBOutlet weak var speed: UILabel!
    
    
    @IBOutlet weak var aodSliderButton: UISlider!
    @IBOutlet weak var aodProgressView: UIProgressView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        topView.clipsToBounds = true
        topView.layer.cornerRadius = 3
        topView.backgroundColor = UIColor(rgb: 0xE5E5E5)
        
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 14
        if #available(iOS 11.0, *) {
            bgView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner,.layerMaxXMinYCorner)
        } else {
            // Fallback on earlier versions
        }
        
        detailImgView.clipsToBounds = true
        detailImgView.layer.cornerRadius = 6
        
        aodTitle.text = "JTBC 뉴스"
        aodTitle.font = UIFont(name: "NotoSansKR-Medium", size: 16)
     
        midTitle.font = UIFont(name: "NotoSansKR-Medium", size: 16)
        
        bottomTitle.font = UIFont(name: "NotoSansKR-Regular", size: 13)
        bottomTitle.text = "JTBC뉴스룸"
        bottomTitle.textColor = UIColor(rgb:0x767676)
        
        startTime.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        startTime.text = "00:00:00"
        startTime.textColor = UIColor(rgb: 0x5F6267)
        
        endTime.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        endTime.text = "01:00:00"
        endTime.textColor = UIColor(rgb: 0x5F6267)
        
        speed.font = UIFont(name: "NotoSansKR-Medium", size: 10)
        
    }
    
    @IBAction func listTabAction(_ sender: Any) {
        print("listTabActionlistTabAction")
    }
}
