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
    
    unowned var rootView: MainView { return self.view as! MainView}
    unowned var collectionView: UICollectionView { return self.rootView.collectionView }
    
    
    override func loadView() {
        self.view = MainView()
    }
    
    override func viewDidLoad() {
        
    }
}

