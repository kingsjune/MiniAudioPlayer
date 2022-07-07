//
//  DetailViewController.swift
//  MiniAudioPlayer
//
//  Created by bhj on 2022/06/30.
//

import UIKit

class DetailViewController: UIViewController {
    
    fileprivate weak var containerVC: UIViewController!
    fileprivate var containerViewObjects = Dictionary<String,UIViewController>()
    
    var animationDurationWithOptions:(TimeInterval, UIView.AnimationOptions) = (0,[])
    var tapCloseButtonActionHandler: (() -> Void)?

    open var currentViewController: UIViewController{
        get {
            return self.containerVC
        }
    }
    
    open var viewControllers: [UIViewController] {
        get {
            return Array(containerViewObjects.values)
        }
    }
    
    fileprivate var segueIdentifier: String!
    
    @IBInspectable internal var firstLinkedSubView: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tap)
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        if let identifier = firstLinkedSubView{
            segueIdentifierReceivedFromParent(identifier)
        }
    }
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func segueIdentifierReceivedFromParent(_ identifier: String){
        self.segueIdentifier = identifier
        self.performSegue(withIdentifier: self.segueIdentifier, sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)


    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @objc func handleTap() {
//        self.tapCloseButtonActionHandler?()
//        self.dismiss(animated: true, completion: nil)
    }
    
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == segueIdentifier{
//            //Remove Container View
//            if containerVC != nil{
//                containerVC.view.removeFromSuperview()
//                containerVC = nil
//
//            }
//            //Add to dictionary if isn't already there
//            if ((self.containerViewObjects[self.segueIdentifier] == nil)){
//                containerVC = segue.destination
//                self.containerViewObjects[self.segueIdentifier] = containerVC
//
//            }else{
//                for (key, value) in self.containerViewObjects{
//                    if key == self.segueIdentifier{
//                        containerVC = value
//                    }
//                }
//            }
//
//            UIView.transition(with: self.view, duration: animationDurationWithOptions.0, options: animationDurationWithOptions.1, animations: {
//                self.addChild(self.containerVC)
//                self.containerVC.view.frame = CGRect(x: 0,y: 0, width: self.view.frame.width,height: self.view.frame.height)
//                self.view.addSubview(self.containerVC.view)
//            }, completion: { (complete) in
//                self.containerVC.didMove(toParent: self)
////                didMove(toParentViewController: self)
//            })
//        }
    }
}
