//
//  BooleanTypeCell.swift
//  IvyCPG
//
//  Created by Sunitha Balasubramanian on 21/09/20.
//  Copyright © 2020 IVY Mobility Solutions Ltd. All rights reserved.
//

import UIKit

class BooleanTypeCell: UICollectionViewCell {

    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    var input: Bool? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        refreshState()
        // Initialization code
    }

    func refreshState() {
        guard let inputValue = input else {
            falseButton.setTitleColor(UIColor.lightGray, for: .normal)
            falseButton.setImage(UIImage(named: "radio_off"), for: .normal)
            trueButton.setTitleColor(UIColor.lightGray, for: .normal)
            trueButton.setImage(UIImage(named: "radio_off"), for: .normal)
            return
        }
        if inputValue {
            trueButton.setTitleColor(UIColor.blue, for: .normal)
            trueButton.setImage(UIImage(named: "radio_on"), for: .normal)
            falseButton.setTitleColor(UIColor.lightGray, for: .normal)
            falseButton.setImage(UIImage(named: "radio_off"), for: .normal)
        } else {
            falseButton.setTitleColor(UIColor.blue, for: .normal)
            falseButton.setImage(UIImage(named: "radio_on"), for: .normal)
            trueButton.setTitleColor(UIColor.lightGray, for: .normal)
            trueButton.setImage(UIImage(named: "radio_off"), for: .normal)
        }
    }
    
    @IBAction func trueButtonTapped(_ sender: Any) {
        input = true
        refreshState()
    }
    
    @IBAction func falseButtonTapped(_ sender: Any) {
        input = false
        refreshState()
    }
}
