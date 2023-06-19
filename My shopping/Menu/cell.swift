//
//  cell.swift
//  My shopping
//
//  Created by Abdusamad Mamasoliyev on 24/05/23.
//

import UIKit

class cell: UICollectionViewCell {

    @IBOutlet weak var conteinerView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var narxLbl: UILabel!
    @IBOutlet weak var savatBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        conteinerView.layer.cornerRadius = 15
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        savatBtn.layer.cornerRadius = 10
    }

    @IBAction func savatgaQoshishBtn(_ sender: UIButton) {
       
    }
}
