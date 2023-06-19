//
//  seeProduct.swift
//  My shopping
//
//  Created by Abdusamad Mamasoliyev on 24/05/23.
//

import UIKit

class seeProduct: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNomiLbl: UILabel!
    @IBOutlet weak var productNarxLbl: UILabel!
    @IBOutlet weak var productTarifLbl: UILabel!
    @IBOutlet weak var savatBtn: UIButton!
    
    var malumot: Malumot?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Mahsulot to'liq malumotini boshqa oynada korsatuvchi kod
        if let malumot {

            productImage.image = malumot.image
            productNomiLbl.text = malumot.modeli
            productNarxLbl.text = "$\(malumot.narxi)"
            productTarifLbl.text = malumot.tarif
            productImage.layer.borderColor = UIColor.darkGray.cgColor
            productImage.layer.borderWidth = 1

            var frame = productImage.frame
            frame.size = malumot.image.size
            productImage.frame = frame
         }
        
      
        productImage.layer.cornerRadius = 20
        savatBtn.layer.cornerRadius = 15

    }

    @IBAction func disBtn(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
  

}
