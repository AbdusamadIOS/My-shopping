//
//  AppDelegate.swift
//  My shopping
//
//  Created by Abdusamad Mamasoliyev on 18/05/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       window = UIWindow()
        
        let vc  = Tabbar()
      
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }

    
   

}

