//
//  MainDataSource.swift
//  PokedexFFUF
//
//  Created by FFUF on 04/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import Foundation
import Rapid
import IGListKit

final class MainDataSource<Cell: UICollectionViewCell, Object: ListDiffable>: JAObject, ListAdapterDataSource where Cell: Configurable, Cell.Object == Object {
    
    // MARK: Initializer
    init( objects: [Object]) {
//        self.delegate = delegate
        self.objects = objects
        super.init()
    }
    
    // MARK: Stored Properties
    let objects: [Object]
//    fileprivate unowned let delegate: MainSectionControllerDelegate
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        
        return self.objects
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return MainSectionController<Cell, Object>()
    }
    
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

}

