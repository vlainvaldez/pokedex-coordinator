//
//  PokedexAppCoordinator.swift
//  PokedexFFUF
//
//  Created by FFUF on 02/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import Foundation
import FSwiftParser
import Rapid

public class PokedexAppCoordinator: AppCoordinator<UINavigationController> {
    
    public override init(window: UIWindow, rootViewController: UINavigationController) {
        super.init(window: window, rootViewController: rootViewController)
        
        self.window.backgroundColor = UIColor.blue
        self.window.rootViewController = self.rootViewController
        self.window.makeKeyAndVisible()
        
        self.rootViewController.navigationBar.isTranslucent = false
    }
    
    override public func start() {
        let mainCoordinator: MainCoordinator = MainCoordinator (navigationController: self.rootViewController)
        
        mainCoordinator.start()
        self.add(childCoordinator: mainCoordinator)
    }
    
}
