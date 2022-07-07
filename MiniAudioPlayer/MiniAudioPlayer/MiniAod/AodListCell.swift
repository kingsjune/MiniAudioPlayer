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
        newsTitleLabel.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        aodTimeLabel.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        aodTimeLabel.textColor = UIColor(rgb: 0x5F6267)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
