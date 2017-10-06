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
    
    // MARK: Delegate Properties
    fileprivate unowned let delegate: DetailCoordinatorDelegate
    
    init(delegate:DetailCoordinatorDelegate, navigationController: UINavigationController){
        self.delegate = delegate
        self.navigationController = navigationController
        super.init()
    }
    
    
    override public func start() {
        let vc: DetailVC = DetailVC(delegate: self)
        self.navigationController.pushViewController(vc, animated: true)
    }
}

extension DetailCoordinator: DetailVCDelegate {
    func backButtonItemPressed() {        
        _ = self.navigationController.popViewController(animated: true)
        self.delegate.detailCoordinatorDismissView(self)
    }
    
    
}
