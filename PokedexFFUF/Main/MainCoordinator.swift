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
        let csvPath: String? = Bundle.main.path(forResource: "pokemon", ofType: "csv")
        
        do {
            
            let rawCSV: RawCSV = try RawCSV(filePath: csvPath)
            let objects: [PokemonIcon] = rawCSV.rows.map { PokemonIcon(dict: $0) }
            
            let vc: Mainvc = Mainvc(objects: objects)
            self.navigationController.viewControllers = [vc]
            
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
}


