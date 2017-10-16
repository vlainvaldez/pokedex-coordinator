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
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
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
    
    let stackViewEvolution: UIStackView = {
        let view: UIStackView = UIStackView()
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.alignment = .fill
//        view.spacing = 2.0
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
        
        self.rpd.subviews(forAutoLayout: [self.imageView,
                                          self.descriptionTextView,
                                          self.stackViewContainerStat,
                                          self.evolutionOverlay,
                                          self.stackViewEvolution])
        
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
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
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
        
        self.stackViewEvolution.snp.remakeConstraints { [unowned self](make: ConstraintMaker) -> Void in
            make.top.equalTo(self.evolutionOverlay.snp.bottom)
            make.width.equalTo(300.0)
            make.height.equalTo(100.0)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DescriptionCell: Configurable {
    static var identifier: String  = "DescriptionCell"
    
    func createEvolutionImage(evolution: Evolution) {
        
        self.stackViewEvolution.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        evolution.nodes.forEach { (evolutionNode)->Void in
            let image: UIImage? = UIImage(named: "\(evolutionNode.id)")
            let imageView: UIImageView = {
                let view: UIImageView = UIImageView(image: image)
                view.contentMode = UIViewContentMode.scaleAspectFit
                view.clipsToBounds = true
                return view
            }()
            
            self.stackViewEvolution.addArrangedSubview(imageView)
        }
    }
    
    func configure(with descriptionModel: DescriptionModel) {
        
        self.descriptionTextView.text = descriptionModel.species.pokemonDescription
        self.imageView.image = UIImage(named: "\(descriptionModel.pokemon.id)")
        
        self.heightValueLabel.text = "\(descriptionModel.pokemon.height)"
        self.idValueLabel.text = "\(descriptionModel.pokemon.id)"
        self.weightValueLabel.text = "\(descriptionModel.pokemon.weight) kg"
        
        self.createEvolutionImage(evolution: descriptionModel.evolution)
        
        self.typeValueLabel.adjustsFontSizeToFitWidth = true
        self.typeValueLabel.text = self.setTypeText(types: descriptionModel.pokemon.types)
        
        
        var navigationBarColor: UIColor?
        
        if descriptionModel.pokemon.types.count > 1 {
            navigationBarColor = descriptionModel.pokemon.types[1].typeDetail.pokemonType.color
        }else{
            navigationBarColor = descriptionModel.pokemon.types[0].typeDetail.pokemonType.color
        }
        
        self.evolutionOverlay.backgroundColor = navigationBarColor
    }
    
    func setTypeText(types: [Types])-> String {
        var typeValue: String = ""
        for (index, value )in types.enumerated(){
            if index == 0 {
                typeValue.append(value.typeDetail.name.capitalized)
            }else{
                typeValue.append("/\(value.typeDetail.name.capitalized)")
            }
        }
        return typeValue
    }
    
}
