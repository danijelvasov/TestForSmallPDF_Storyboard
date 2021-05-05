//
//  UIImage + Extension.swift
//  TestForSmallPDF
//
//  Created by Danijel Vasov on 4/28/21.
//  Copyright © 2021 Danijel Vasov. All rights reserved.
//

import UIKit

extension UIImageView {
    func applyStarMask(){
        let mask = UIImageView(image: UIImage(named: "maskStar"))
        mask.frame = self.bounds
        self.mask = mask
    }
}
