//
//  DescriptionCell.swift
//  PokedexFFUF
//
//  Created by FFUF on 09/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import UIKit
import SnapKit
import Rapid

final class DescriptionCell: UICollectionViewCell {
    
    // MARK: Subviews
    let imageView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.contentMode = UIViewContentMode.scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    let descriptionTextView: UITextView = {
        let view: UITextView = UITextView()
        view.text = ""
        view.font = UIFont.systemFont(ofSize: 13.0)
        view.backgroundColor = UIColor.white
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.rpd.subviews(forAutoLayout: [self.imageView, self.descriptionTextView])
        
        self.imageView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(30.0)
            make.leading.equalToSuperview().offset(10.0)
            make.width.equalTo(100.0)
            make.height.equalTo(100.0)
        }
        
        self.descriptionTextView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(30.0)
            make.leading.equalTo(self.imageView.snp.trailing).offset(5.0)
            make.trailing.equalToSuperview().inset(10.0)
            make.height.equalTo(150.0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DescriptionCell: Configurable {
    static var identifier: String  = "DescriptionCell"
    
    func configure(with descriptionModel: DescriptionModel) {
        
        self.descriptionTextView.text = descriptionModel.species.pokemonDescription
        self.imageView.image = UIImage(named: String(descriptionModel.pokemon.id))
    }
    
}
