//
//  CategoryCell.swift
//  My shopping
//
//  Created by Abdusamad Mamasoliyev on 23/05/23.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var conteneirV: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nomLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

        conteneirV.layer.cornerRadius = 15
        
       
        
    }

}
