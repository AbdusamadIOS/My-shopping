//
//  MainVC.swift
//  My shopping
//
//  Created by Abdusamad Mamasoliyev on 23/05/23.
//

import UIKit

class Tabbar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let menu = MenuVC(nibName: "MenuVC", bundle: nil)
        
        menu.tabBarItem.title = "Bosh sahifa"
        menu.tabBarItem.image = UIImage(systemName: "house")
        
        let category = CategoryVC(nibName: "CategoryVC", bundle: nil)
        
        category.tabBarItem.title = "Toifa"
        category.tabBarItem.image = UIImage(systemName: "square.grid.2x2")
        
        let kozinka = KorzinkaVC(nibName: "KorzinkaVC", bundle: nil)
        
        kozinka.tabBarItem.title = "Savat"
        kozinka.tabBarItem.image = UIImage(systemName: "basket")
        
        let profil = ProfilVC(nibName: "ProfilVC", bundle: nil)
        
        profil.tabBarItem.title = "Profil"
        profil.tabBarItem.image = UIImage(systemName: "person")
        
        viewControllers = [menu, category, kozinka, profil]
        
        tabBar.backgroundColor = .white
    }



}
