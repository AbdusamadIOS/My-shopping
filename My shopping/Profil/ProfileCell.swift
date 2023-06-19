//
//  ProfileCell.swift
//  My shopping
//
//  Created by Abdusamad Mamasoliyev on 26/05/23.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var conteneirView: UIView!
    @IBOutlet weak var sozlamaImg: UIImageView!
    @IBOutlet weak var sozlamaNomiLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        conteneirView.layer.cornerRadius = 10
        sozlamaImg.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
