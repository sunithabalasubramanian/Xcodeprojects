//
//  CGDisplayableCell.swift
//  IvyCPG
//
//  Created by Balaji Malliswamy on 10/09/20.
//  Copyright © 2020 IVY Mobility Solutions Ltd. All rights reserved.
//

import UIKit

class CGDisplayableCell: UITableViewCell {
    
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var displayBackgroundView: UIView! {
        didSet{
            displayBackgroundView.layer.cornerRadius = 6
            displayBackgroundView.layer.shadowRadius = 4
        }
    }
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib.init(nibName: "DecimalTypeCell", bundle: nil), forCellWithReuseIdentifier: "DecimalTypeCell")
        }
    }
    @IBOutlet weak var itemCollectionHeight: NSLayoutConstraint!
    //MARK:  Identifier
    var delegate : UITextFieldDelegate!
    var position = 0
    static var identifier: String {
        return String(describing: self)
    }
    
    
//    func configData(data: Displayable) {
//        self.nameLabel.text = data.name
//        self.descriptionLabel.text = "\(data.desc ?? "")"
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.collectionView.reloadData()
//        self.collectionView.layoutIfNeeded()
        self.itemCollectionHeight.constant = CGFloat(self.getHeightforCollection(count: 5))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    fileprivate func getHeightforCollection(count: Int) -> Double {
        let defaultHeight = 64.0
        let quotient = (Double(count) / 3.0).rounded(.up)
        return (quotient * defaultHeight)
    }
    
}

extension CGDisplayableCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DecimalTypeCell", for: indexPath) as! DecimalTypeCell
        collectionCell.steupUI(delegate: delegate, tableposition: position, collectionPosition: indexPath.row)
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.itemView.bounds.size.width / 3), height: 64.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
