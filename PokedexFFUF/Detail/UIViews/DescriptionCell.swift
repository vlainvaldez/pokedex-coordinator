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
    
    let heightTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Height:"
        view.font = UIFont.boldSystemFont(ofSize: 13.0)
        return view
    }()
    
    let heightValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "173cm"
        view.font = UIFont.systemFont(ofSize: 13.0)
        return view
    }()
    
    let weightTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Weight:"
        view.font = UIFont.boldSystemFont(ofSize: 13.0)
        return view
    }()
    
    let weightValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "2.2kg"
        view.font = UIFont.systemFont(ofSize: 13.0)
        return view
    }()
    
    let typeTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Type:"
        view.font = UIFont.boldSystemFont(ofSize: 13.0)
        return view
    }()
    
    let typeValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Fairy/Ghost"
        view.font = UIFont.systemFont(ofSize: 13.0)
        return view
    }()
    
    let idTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "ID:"
        view.font = UIFont.boldSystemFont(ofSize: 13.0)
        return view
    }()
    
    let idValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "999"
        view.font = UIFont.systemFont(ofSize: 13.0)
        return view
    }()
    
    let stackViewStatTop: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let stackViewStatBottom: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let stackViewContainerStat: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    let evolutionOverlay: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = CustomColors.red
        return view
    }()
    
    let evolutionLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Evolution(s)"
        view.textColor = UIColor.white
        view.font = UIFont.boldSystemFont(ofSize: 15.0)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        let descStatLabelsTop: [UILabel] = [self.heightTitleLabel,
                                            self.heightValueLabel,
                                            self.idTitleLabel,
                                            self.idValueLabel]
        
        let descStatLabelsBottom: [UILabel] = [self.weightTitleLabel,
                                               self.weightValueLabel,
                                               self.typeTitleLabel,
                                               self.typeValueLabel]
        
        
        
        descStatLabelsTop.forEach { [unowned self] (labels) -> Void in
            self.stackViewStatTop.addArrangedSubview(labels)
        }
        
        descStatLabelsBottom.forEach { [unowned self] (labels) -> Void in
            self.stackViewStatBottom.addArrangedSubview(labels)
        }
        
        let descStackViews: [UIStackView] = [self.stackViewStatTop, self.stackViewStatBottom]
        
        descStackViews.forEach { [unowned self] (stackViews) -> Void  in
            self.stackViewContainerStat.addArrangedSubview(stackViews)
        }
        
        self.rpd.subviews(forAutoLayout: [self.imageView, self.descriptionTextView,  self.stackViewContainerStat, self.evolutionOverlay])
        
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
        
        self.stackViewContainerStat.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.descriptionTextView.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        self.evolutionOverlay.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.stackViewContainerStat.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(40.0)
            make.width.equalToSuperview()
        }
        
        self.evolutionOverlay.rpd.subview(forAutoLayout: self.evolutionLabel)
        
        self.evolutionLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(5.0)
            make.leading.equalToSuperview().offset(20.0)
            make.bottom.equalToSuperview().inset(5.0)
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
        self.imageView.image = UIImage(named: "\(descriptionModel.pokemon.id)")
        
        self.heightValueLabel.text = "\(descriptionModel.pokemon.height)"
        self.idValueLabel.text = "\(descriptionModel.pokemon.id)"
        self.weightValueLabel.text = "\(descriptionModel.pokemon.weight) kg"
    }
    
}
