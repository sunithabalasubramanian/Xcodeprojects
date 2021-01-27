//
//  DecimalTypeCell.swift
//  UICollectionViewSample
//
//  Created by Sunitha Balasubramanian on 21/09/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class DecimalTypeCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var inputTextField: myText!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func steupUI(delegate:UITextFieldDelegate,tableposition:Int ,collectionPosition:Int){
        inputTextField.delegate = delegate
        inputTextField.collectionPosition = collectionPosition
        inputTextField.tablePosition = tableposition

    }
}
