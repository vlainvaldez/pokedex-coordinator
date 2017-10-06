//
//  MainCell.swift
//  PokedexFFUF
//
//  Created by FFUF on 03/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import UIKit
import SnapKit
import Rapid

final public class MainCell: UICollectionViewCell {
    
    var pokemonIcon: PokemonIcon!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpViews()
        
    }
    
    var footerConstraints = [NSLayoutConstraint]()
    var nameConstraints = [NSLayoutConstraint]()
    
    let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = CustomColors.darkGrey
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
        
        pokemonImageView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(footerView.snp.top)
        }
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension MainCell: Configurable {
    
    public static var identifier: String = "MainCell"
    
    public func configure(with pokemonIcon: PokemonIcon) {
        self.pokemonIcon = pokemonIcon
        
        self.pokemonImageView.image = UIImage(named: self.pokemonIcon.id)
        self.nameLabel.text = self.pokemonIcon.name        
    }
    
}
