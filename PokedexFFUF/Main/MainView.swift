//
//  MainView.swift
//  PokedexFFUF
//
//  Created by FFUF on 03/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import UIKit
import SnapKit
import Rapid
import IGListKit

public final class MainView: JAView {
    
    let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        self.rpd.subview(forAutoLayout: self.collectionView)
        
        self.collectionView.snp.makeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(20.0)
            make.leading.equalTo(self).offset(10.0)
            make.trailing.equalTo(self).inset(10.0)
            make.bottom.equalTo(self)
        }
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
