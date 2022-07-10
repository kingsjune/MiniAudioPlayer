//
//  AodListCell.swift
//  MiniAudioPlayer
//
//  Created by bhj on 2022/07/07.
//

import UIKit

class AodListCell: UITableViewCell {

    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var aodTimeLabel: UILabel!
    @IBOutlet weak var playIMG: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
   }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        newsTitleLabel.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        aodTimeLabel.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        aodTimeLabel.textColor = UIColor(rgb: 0x5F6267)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.playIMG.image = UIImage(named: "28xpause")
        } else {
            self.playIMG.image = UIImage(named: "28xplay")
        }
    }
}
