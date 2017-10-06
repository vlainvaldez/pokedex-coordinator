//
//  DetailView.swift
//  PokedexFFUF
//
//  Created by FFUF on 06/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import UIKit
import SnapKit
import Rapid
import IGListKit

final class DetailView: JAView {
    
    let backButtonItem: UIBarButtonItem = {
        let item: UIBarButtonItem = UIBarButtonItem(
            title: "Back",
            style: UIBarButtonItemStyle.plain,
            target: nil,
            action: nil)
        return item
    }()
    
    let segmentControl: UISegmentedControl = {
        let view: UISegmentedControl = UISegmentedControl(items: ["Description", "Stats"])
        view.tintColor = CustomColors.darkGrey
        view.selectedSegmentIndex = 0
        return view
    }()
    
    let collectionView: UICollectionView = {
        let segmentCollectionLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        segmentCollectionLayout.scrollDirection = .horizontal
        segmentCollectionLayout.minimumLineSpacing = 0.0
        let collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout:segmentCollectionLayout )
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        self.rpd.subviews(forAutoLayout: [self.segmentControl, self.collectionView])
        
        self.segmentControl.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(30.0)
        }
        
        self.collectionView.snp.remakeConstraints { [unowned self] (make:ConstraintMaker) -> Void in
            make.top.equalTo(self.segmentControl.snp.bottom).offset(15.0)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
