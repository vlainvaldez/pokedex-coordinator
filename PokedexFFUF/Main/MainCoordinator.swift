//
//  MainCoordinator.swift
//  PokedexFFUF
//
//  Created by FFUF on 02/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import UIKit
import Rapid

public final class MainCoordinator: AbstractCoordinator {
    
    fileprivate unowned let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    public override func start() {
        self.navigationController.navigationBar.barTintColor = UIColor.yellow
        let vc: Mainvc = Mainvc()
        
        self.navigationController.viewControllers = [vc]
    }
}


