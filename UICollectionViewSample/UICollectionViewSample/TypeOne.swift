//
//  TypeOne.swift
//  UICollectionViewSample
//
//  Created by Sunitha Balasubramanian on 21/09/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class TypeOne: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }

}
