//
//  UserCell.swift
//  TestForSmallPDF
//
//  Created by Danijel Vasov on 4/28/21.
//  Copyright © 2021 Danijel Vasov. All rights reserved.
//

import UIKit
import SDWebImage

class UserCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var ivUserphoto: UIImageView!
    @IBOutlet weak var lbUsername: UILabel!
    @IBOutlet weak var lbAge: UILabel!
    @IBOutlet weak var lbNationality: UILabel!
    
    var onCellTapped : (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ivUserphoto.applyStarMask()
    }
    
    //MARK: - Private methods
    func setupCellWithData(user: User) {
        if let userFirstName = user.name?.first,
            let userLastName = user.name?.last,
            let userAge = user.dob?.age,
            let userNat = user.nat {
                self.lbUsername.text = "\(userFirstName), \(userLastName)"
                self.lbAge.text = "\(userAge)"
                self.lbNationality.text = userNat
        }
        
        if let thumbnailImage = user.picture?.thumbnail {
            ivUserphoto.sd_setImage(with: URL(string: thumbnailImage), placeholderImage: UIImage(named: PlaceholderImage.user.rawValue))
        }
    }

    
    //MARK: - Actions
    @IBAction func actionTap(_ sender: Any) {
        if let onCellTap = self.onCellTapped {
            onCellTap()
        }
    }
    
}
