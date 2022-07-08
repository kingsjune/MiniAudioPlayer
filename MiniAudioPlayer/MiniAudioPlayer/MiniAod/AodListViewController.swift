//
//  AodListViewController.swift
//  MiniAudioPlayer
//
//  Created by bhj on 2022/07/06.
//

import UIKit

class AodListViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet var bgView: UIView!
    @IBOutlet weak var aodTitle: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .white
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 14
        if #available(iOS 11.0, *) {
            bgView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner,.layerMaxXMinYCorner)
        } else {
            // Fallback on earlier versions
        }
        
        topView.clipsToBounds = true
        topView.layer.cornerRadius = 3
        topView.backgroundColor = UIColor(rgb: 0xE5E5E5)
        
        aodTitle.text = "JTBC 뉴스"
        aodTitle.font = UIFont(name: "NotoSansKR-Medium", size: 16)
        
        tableView.backgroundColor = .white
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension
    }
}


extension AodListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AodListCell", for: indexPath) as? AodListCell else {
            return UITableViewCell()
        }
        cell.newsTitleLabel.text = "2022년 3월 18일 (목)JTBC 뉴스룸 "
        cell.aodTimeLabel.text = "20:00"
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath\(indexPath)")
        let cell = tableView.cellForRow(at: indexPath) as! AodListCell
//        cell.playIMG.image = UIImage(named: "28xpause")
    }
    
}
