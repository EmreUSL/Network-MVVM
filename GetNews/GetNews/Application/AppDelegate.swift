//
//  AppDelegate.swift
//  GetNews
//
//  Created by emre usul on 16.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame:  UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.systemBackground
        
      
        let model: TopHeadlinesViewModel = TopHeadlinesDefaultViewModel(networkService: DefaultNetworkService())
        let controller = UINavigationController(rootViewController: HeadlinesViewController(model: model))
        window?.rootViewController = controller
        
        return true
    }

}

