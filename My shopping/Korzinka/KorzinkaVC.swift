//
//  KorzinkaVC.swift
//  My shopping
//
//  Created by Abdusamad Mamasoliyev on 23/05/23.
//

import UIKit

class KorzinkaVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    var kozinkaMalumoti: [KorzinkaMalumoti] = [KorzinkaMalumoti(mahsulotNomi: "Iphone 14 pro 256 GB", mahsulotNarxi: "$999", mahsulotImage: UIImage(named: "phone1")!, ischecked: false),
                                               KorzinkaMalumoti(mahsulotNomi: "Macbook pro 13 dyum M1 8/1 TB", mahsulotNarxi: "$1560", mahsulotImage: UIImage(named: "mac1")!, ischecked: true),
                                               KorzinkaMalumoti(mahsulotNomi: "Display", mahsulotNarxi: "$2000", mahsulotImage: UIImage(named: "dis1")!, ischecked: false),
                                               KorzinkaMalumoti(mahsulotNomi: "Iwatch ultra", mahsulotNarxi: "$799", mahsulotImage: UIImage(named: "watch2")!, ischecked: false),
                                               KorzinkaMalumoti(mahsulotNomi: "Iphone 13 pro max 512 GB", mahsulotNarxi: "$1099", mahsulotImage: UIImage(named: "phone2")!, ischecked: false),
                                               KorzinkaMalumoti(mahsulotNomi: "Airpods 3", mahsulotNarxi: "$225", mahsulotImage: UIImage(named: "air1")!, ischecked: false),
                                               KorzinkaMalumoti(mahsulotNomi: "Case iphone 14 pro", mahsulotNarxi: "$99", mahsulotImage: UIImage(named: "case")!, ischecked: false),
                                               KorzinkaMalumoti(mahsulotNomi: "Iwatch se ", mahsulotNarxi: "$499", mahsulotImage:  UIImage(named: "watch1")!, ischecked: false),
                                               KorzinkaMalumoti(mahsulotNomi: "Airpods pro", mahsulotNarxi: "$649", mahsulotImage: UIImage(named: "air2")!, ischecked: false),
                                               KorzinkaMalumoti(mahsulotNomi: "Apple Keyboard", mahsulotNarxi: "$89", mahsulotImage: UIImage(named: "key")!, ischecked: false),
                                               KorzinkaMalumoti(mahsulotNomi: "Iphone 14 256 GB", mahsulotNarxi: "$699", mahsulotImage: UIImage(named: "iphone3")!, ischecked: false),
                                
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ProductBuyTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductBuyTableViewCell")
       
    }
    


    
}

extension KorzinkaVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kozinkaMalumoti.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductBuyTableViewCell") as! ProductBuyTableViewCell
        
        cell.productImage.image = kozinkaMalumoti[indexPath.row].mahsulotImage
        cell.modeli.text = kozinkaMalumoti[indexPath.row].mahsulotNomi
        cell.narxi.text = kozinkaMalumoti[indexPath.row].mahsulotNarxi
        
        cell.selectionStyle = .none
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        88
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let deleteAction = UIContextualAction(style: .normal, title: "O'chirish") { _,_,_ in
            self.kozinkaMalumoti.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        
        deleteAction.backgroundColor = UIColor.red
        
        
        
        let swipe = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return swipe
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let alert = UIAlertController(title: "Haqiqatdan ham bu mahsulotni sotib olmoqchimisiz?", message: nil, preferredStyle: .alert)

        let Ha = UIAlertAction(title: "Ha", style: .default ) { [self] _ in


                   let buyProduct = SotibOlishVC(nibName: "SotibOlishVC", bundle: nil)
            
                    buyProduct.korzinka = kozinkaMalumoti[indexPath.row]
            
                    buyProduct.modalTransitionStyle = .coverVertical
                    buyProduct.modalPresentationStyle = .fullScreen
            
                    self.present(buyProduct, animated: true)
        }

       let orqaga = UIAlertAction(title: "Orqaga", style: .cancel)

        alert.addAction(Ha)
      
        alert.addAction(orqaga)
        self.present( alert, animated: true)
    }
}



