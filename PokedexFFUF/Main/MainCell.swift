//
//  MainCell.swift
//  PokedexFFUF
//
//  Created by FFUF on 03/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import UIKit

class MainCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpViews()
    }
    
    var footerConstraints = [NSLayoutConstraint]()
    var nameConstraints = [NSLayoutConstraint]()
    
    let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "sample"
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AvenirNext-Regular", size: 12)
        return label
    }()
    
    var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setUpViews(){
        
        
        self.rpd.subviews(forAutoLayout: footerView, pokemonImageView)
        
//        addSubview(footerView)
        
        let footerViewBottom = footerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        let footerViewWidth = footerView.widthAnchor.constraint(equalTo: widthAnchor)
        let footerViewHeight = footerView.heightAnchor.constraint(equalToConstant: 20.0)
        
        footerConstraints.append(contentsOf: [footerViewBottom,footerViewWidth,footerViewHeight])
        
        NSLayoutConstraint.activate(footerConstraints)
        
        footerView.addSubview(nameLabel)
        
        let nameXConstraint = nameLabel.centerXAnchor.constraint(equalTo: footerView.centerXAnchor)
        let nameYConstraint = nameLabel.centerYAnchor.constraint(equalTo: footerView.centerYAnchor)
        
        nameConstraints.append(contentsOf: [nameXConstraint, nameYConstraint])
        
        NSLayoutConstraint.activate(nameConstraints)
        
//        addSubview(pokemonImageView)
        
        pokemonImageView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(footerView.snp.top)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
