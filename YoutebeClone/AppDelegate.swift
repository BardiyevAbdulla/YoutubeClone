//
//  AppDelegate.swift
//  YoutebeClone
//
//  Created by admin on 11/14/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        //layout.scrollDirection = .horizontal
        
        window?.rootViewController = UINavigationController(rootViewController: ViewController( collectionViewLayout: layout))
       // UINavigationBar.appearance().barTintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        
        
        //MARK -> get rid of black bar under navbar
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarPosition.bottom, barMetrics: .default)
        
        
        application.statusBarStyle = .lightContent
       
        statusBar()
        return true
    }
    func statusBar(){
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = UIColor(red: 194/255, green: 31/255, blue: 31/255, alpha: 1)
        
        window?.addSubview(statusBarBackgroundView)
        statusBarBackgroundView.Anchor(top: window?.topAnchor,left: window?.leftAnchor,right: window?.rightAnchor,height: 100)
        
    }
    


}

