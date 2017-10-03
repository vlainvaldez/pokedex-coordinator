//
//  MainVC.swift
//  PokedexFFUF
//
//  Created by FFUF on 02/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import UIKit
import Rapid
import IGListKit

final class Mainvc: JAViewController {
    
    override func loadView() {
        self.view = MainView()
        self.view.backgroundColor = UIColor.darkGray
        
    }
}
