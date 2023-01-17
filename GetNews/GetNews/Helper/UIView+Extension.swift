//
//  UIView+Extension.swift
//  GetNews
//
//  Created by emre usul on 16.01.2023.
//


import UIKit

extension UIViewController  {
    func setTabBarImage(imageName:String,title:String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}

extension UIViewController {
    func setNavBar(title:String,preferredLarge:Bool) {
        navigationItem.title = title
        navigationController?.navigationBar.prefersLargeTitles = preferredLarge
    }
        
}


