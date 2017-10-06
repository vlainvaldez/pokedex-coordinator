//
//  DetailVC.swift
//  PokedexFFUF
//
//  Created by FFUF on 06/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import UIKit
import Rapid

final class DetailVC: JAViewController {
    
    // MARK: Delegate Properties
    fileprivate unowned let delegate: DetailVCDelegate
    
    init(delegate: DetailVCDelegate){
        self.delegate = delegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = DetailView()
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavigationItem { [unowned self] (navigationItem: UINavigationItem) in
            
            navigationItem.leftBarButtonItem = self.rootView.backButtonItem
            self.rootView.backButtonItem.target = self
            self.rootView.backButtonItem.action = #selector(backButtonAction)
        }
        
    }
}

//MARK - Views
fileprivate extension DetailVC {
    unowned var rootView: DetailView { return self.view as! DetailView }
}


// MARK: Target Action Functions
fileprivate extension DetailVC {
    @objc func backButtonAction() {
        self.delegate.backButtonItemPressed()
    }
    
}
