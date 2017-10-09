//
//  DetailCoordinator.swift
//  PokedexFFUF
//
//  Created by FFUF on 06/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import UIKit
import Rapid

public final class DetailCoordinator: AbstractCoordinator {
    // MARK: Stored Properties
    fileprivate unowned let navigationController: UINavigationController
    fileprivate let models: DetailModels
    
    // MARK: Delegate Properties
    fileprivate unowned let delegate: DetailCoordinatorDelegate
    
    init(delegate:DetailCoordinatorDelegate, navigationController: UINavigationController, models: DetailModels){
        
        self.delegate = delegate
        self.navigationController = navigationController
        self.models = models
        super.init()
        
        
    }    
    
    override public func start() {
        let vc: DetailVC = DetailVC(delegate: self, models: self.models)
        self.navigationController.pushViewController(vc, animated: true)
    }
}

extension DetailCoordinator: DetailVCDelegate {
    func backButtonItemPressed() {        
        _ = self.navigationController.popViewController(animated: true)
        self.delegate.detailCoordinatorDismissView(self)
    }
}
