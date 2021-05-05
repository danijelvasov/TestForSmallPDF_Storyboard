//
//  DetailVC.swift
//  TestForSmallPDF
//
//  Created by Danijel Vasov on 4/28/21.
//  Copyright © 2021 Danijel Vasov. All rights reserved.
//

import UIKit
import SDWebImage
import MessageUI

class DetailVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var ivUserphoto: UIImageView!
    @IBOutlet weak var lbUsername: UILabel!
    @IBOutlet weak var lbAge: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    
    //MARK: - vars & consts
    var user: User?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        self.setupUI()
    }
    
    //MARK: - Private methods
    fileprivate func setupUI(){
        DispatchQueue.main.async {
            self.ivUserphoto.applyStarMask()
        }
        if let userFirstName = user?.name?.first,
            let userLastName = user?.name?.last,
            let userAge = user?.dob?.age,
            let userEmail = user?.email {
                self.lbUsername.text = "\(userFirstName), \(userLastName)"
                self.lbAge.text = "\(userAge)"
                self.lbEmail.text = userEmail
        }
        
        if let userImage = user?.picture?.large {
            ivUserphoto.sd_setImage(with: URL(string: userImage), placeholderImage: UIImage(named: PlaceholderImage.user.rawValue))
        }
    }
    
    
    //MARK: - Actions
    @IBAction func actionEmailTap(_ sender: Any) {
        if let email = lbEmail.text {
            if MFMailComposeViewController.canSendMail() {
                let mailVC = MFMailComposeViewController()
                mailVC.mailComposeDelegate = self
                mailVC.setSubject("Danijel Vasov")
                mailVC.setToRecipients([email])
                self.present(mailVC, animated: true)
            } else {return}
        }
        //this works only on real device
    }
    
}


extension DetailVC: MFMailComposeViewControllerDelegate {
    
    private func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

