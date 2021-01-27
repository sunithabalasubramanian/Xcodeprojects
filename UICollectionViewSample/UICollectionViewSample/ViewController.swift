//
//  ViewController.swift
//  UICollectionViewSample
//
//  Created by Sunitha Balasubramanian on 21/09/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 110
            tableView.register(UINib(nibName: CGDisplayableCell.identifier, bundle: nil), forCellReuseIdentifier: CGDisplayableCell.identifier)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CGDisplayableCell.identifier, for: indexPath) as? CGDisplayableCell else {
            fatalError("Unexpected index path")
        }
        cell.delegate = self
        cell.position = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension ViewController:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let text = textField  as? myText {
            print("collection : \(text.collectionPosition ?? 0)")
            print("table : \(text.tablePosition ?? 0)")
        }

    }
}
class myText : UITextField {

var tablePosition : Int?
var collectionPosition : Int?

}
