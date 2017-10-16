//
//  DetailVC.swift
//  PokedexFFUF
//
//  Created by FFUF on 06/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import UIKit
import Rapid
import IGListKit

final class DetailVC: JAViewController {
    
    // MARK: Delegate Properties
    fileprivate unowned let delegate: DetailVCDelegate
    
    // MARK: - Stored Properties
    fileprivate var adapter: ListAdapter!
    fileprivate var dataSource: ListAdapterDataSource!
    fileprivate let detailsModels: DetailModels
    fileprivate var sectionIndex: Int
    
    init(delegate: DetailVCDelegate, models: DetailModels){
        self.detailsModels = models
        self.delegate = delegate
        self.sectionIndex = 0
        super.init(nibName: nil, bundle: nil)
        
        let updater: ListAdapterUpdater = ListAdapterUpdater()
        
        self.adapter = ListAdapter(updater: updater, viewController: self)
        self.adapter.collectionView = self.collectionView
        self.adapter.dataSource = self
        self.adapter.collectionViewDelegate = self
        
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
        
        self.setUpTargetActions(with: [self.rootView.segmentControl: #selector (DetailVC.segmentControlPressed(_:))])
    }
}

//MARK - Views
fileprivate extension DetailVC {
    unowned var rootView: DetailView { return self.view as! DetailView }
    unowned var collectionView: UICollectionView { return self.rootView.collectionView}
}


// MARK: Target Action Functions
fileprivate extension DetailVC {
    @objc func backButtonAction() {
        self.delegate.backButtonItemPressed()
    }
    
    @objc func segmentControlPressed(_ control: UISegmentedControl) {
        self.sectionIndex = control.selectedSegmentIndex
        
        let indexPath: IndexPath = IndexPath(row: 0, section: self.sectionIndex)
        
        self.collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)        
    }
}

extension DetailVC: ListAdapterDataSource{
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {

        return [self.detailsModels.descriptionModel, self.detailsModels.statModel]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        
        if object is DescriptionModel {            
            
            return DescriptionSectionController(descriptionModel: object as! DescriptionModel)
        }else {
            return StatsSectionController(statModel: object as! StatModel)
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? { return nil }
}

extension DetailVC: UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index: Int = Int(targetContentOffset.pointee.x / self.view.bounds.width)
        self.rootView.segmentControl.selectedSegmentIndex = index
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        self.rootView.collectionView.collectionViewLayout.invalidateLayout()
        
        let indexPath: IndexPath = IndexPath(row: 0, section: self.sectionIndex)
        
        DispatchQueue.main.async {
            self.rootView.collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
        }
    }
}

