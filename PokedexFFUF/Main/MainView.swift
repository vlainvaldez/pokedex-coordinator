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
        let listCollectionLayout: ListCollectionViewLayout = ListCollectionViewLayout(stickyHeaders: false, topContentInset: 0, stretchToEdge: true)
        let collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout:listCollectionLayout )
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    let indicatorView: UIActivityIndicatorView = {
        let view: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        view.color = CustomColors.red
        view.backgroundColor = CustomColors.darkGrey
        view.hidesWhenStopped = true
        view.isHidden = true
        return view
    }()
    
    func showLoadingIndicatorView(){
        self.indicatorView.isHidden = false
        self.indicatorView.startAnimating()
        self.isUserInteractionEnabled = false
    }
    
    func stopLoadingIndicatorView(){
        self.indicatorView.stopAnimating()
        self.isUserInteractionEnabled = true
    }
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        self.rpd.subviews(forAutoLayout: [self.collectionView, self.indicatorView])
        
        self.collectionView.snp.makeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(20.0)
            make.leading.equalTo(self).offset(10.0)
            make.trailing.equalTo(self).inset(10.0)
            make.bottom.equalTo(self)
        }
        
        self.indicatorView.snp.makeConstraints { (make: ConstraintMaker) -> Void in
            make.center.equalToSuperview()
            make.height.equalTo(75.0)
            make.width.equalTo(75.0)
        }
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

