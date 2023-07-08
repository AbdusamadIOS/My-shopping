//
//  CategoryVC.swift
//  My shopping
//
//  Created by Abdusamad Mamasoliyev on 23/05/23.
//

import UIKit

class CategoryVC: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var category: [Category] = [Category(nom: "Phone", image: UIImage(named: "phone")!),
                                Category(nom: "Imac", image:  UIImage(named: "mac")!),
                                Category(nom: "Imac", image:  UIImage(named: "imac")!),
                                Category(nom: "Display", image:  UIImage(named: "dis")!),
                                Category(nom: "Airpods", image:  UIImage(named: "air")!),
                                Category(nom: "Airtag", image:  UIImage(named: "airtag")!),
                                Category(nom: "Mouse", image:  UIImage(named: "mouse")!),
                                Category(nom: "Iwatch", image:  UIImage(named: "watch")!),
                                Category(nom: "Case", image:  UIImage(named: "case")!),
                                Category(nom: "Adapter", image:  UIImage(named: "adapter")!),
                                Category(nom: "Keyboard", image:  UIImage(named: "key")!),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
           setupColView()
            cellsiz()
    }
    
    func setupColView() {
        collectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        cellsiz()
    }
    
    func cellsiz() {
        let width = ((collectionView.frame.width - 100) / 3)
        let cellSize = CGSize(width: width , height: 140)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}

extension CategoryVC: UICollectionViewDelegate , UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return category.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.nomLbl.text = category[indexPath.row].nom
        cell.imageView.image = category[indexPath.row].image
        
        return cell
    }
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let basket = Addbasket(nibName: "Addbasket", bundle: nil)
        basket.modalTransitionStyle = .coverVertical
        basket.modalPresentationStyle = .fullScreen

        self.present(basket, animated: true)
        

    }
    
}
