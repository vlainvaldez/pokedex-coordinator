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

final class Mainvc: JAViewController{
    
    // MARK: - IBOutlets
    unowned var rootView: MainView { return self.view as! MainView}
    unowned var collectionView: UICollectionView { return self.rootView.collectionView }
    
    // MARK: - Stored Properties
    fileprivate var adapter: ListAdapter!
    fileprivate var dataSource: ListAdapterDataSource!
    
    // MARK: - Delegate Properties
    fileprivate unowned let delegate: MainVCDelegate
    
    override func loadView() {
        self.view = MainView()
    }
    
    init(delegate: MainVCDelegate, objects: [PokemonIcon]){
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        let updater: ListAdapterUpdater = ListAdapterUpdater()
        self.adapter = ListAdapter(updater: updater, viewController: self)
        self.adapter.collectionView = self.collectionView
        self.dataSource = MainDataSource<MainCell, PokemonIcon>(delegate: self,objects: objects)

        self.adapter.dataSource = self.dataSource        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}

extension Mainvc: MainSectionControllerDelegate {
    func selected(cell: MainCell) {
        print("MainSectionControllerDelegate")
        self.delegate.pokemonClicked(cell.pokemonIcon, view: self.rootView)
    }
    
    
}




