//
//  ProductBuyTableViewCell.swift
//  My shopping
//
//  Created by Abdusamad Mamasoliyev on 25/05/23.
//

import UIKit

class ProductBuyTableViewCell: UITableViewCell {

    @IBOutlet weak var contenierView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var narxi: UILabel!
    @IBOutlet weak var modeli: UILabel!
    @IBOutlet weak var tanlashBtn: UIButton!
    
    var korzinka: KorzinkaMalumoti?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contenierView.layer.cornerRadius = 15
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
   
}
