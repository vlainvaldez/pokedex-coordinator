//
//  StatsCell.swift
//  PokedexFFUF
//
//  Created by FFUF on 09/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import UIKit
import SnapKit
import Rapid

final class StatsCell: UICollectionViewCell {
    
    let hpTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "HP"
        view.textAlignment = NSTextAlignment.left
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    let hpValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.textAlignment = NSTextAlignment.center
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    let atkTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Attack"
        view.textAlignment = NSTextAlignment.left
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    let atkValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.textAlignment = NSTextAlignment.center
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    let defTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Defense"
        view.textAlignment = NSTextAlignment.left
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    let defValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.textAlignment = NSTextAlignment.center
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    let spAtkTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Sp. Attack"
        view.textAlignment = NSTextAlignment.left
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    let spAtkValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.textAlignment = NSTextAlignment.center
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    let spDefTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Sp. Defense"
        view.textAlignment = NSTextAlignment.left
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    let spDefValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.textAlignment = NSTextAlignment.center
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    let spdTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Speed"
        view.textAlignment = NSTextAlignment.left
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    let spdValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.textAlignment = NSTextAlignment.center
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    let hpTitleBarView : UIView = {
        let view: UIView = UIView()
        view.backgroundColor = CustomColors.hp
        return view
    }()
    
    let atkTitleBarView : UIView = {
        let view: UIView = UIView()
        view.backgroundColor = CustomColors.atk
        return view
    }()
    
    let defTitleBarView : UIView = {
        let view: UIView = UIView()
        view.backgroundColor = CustomColors.def
        return view
    }()
    
    let spAtkTitleBarView : UIView = {
        let view: UIView = UIView()
        view.backgroundColor = CustomColors.spAtk
        return view
    }()
    
    let spDefTitleBarView : UIView = {
        let view: UIView = UIView()
        view.backgroundColor = CustomColors.spDef
        return view
    }()
    
    let spdTitleBarView : UIView = {
        let view: UIView = UIView()
        view.backgroundColor = CustomColors.spd
        return view
    }()
    
    
    
    var statTitleLabels: [UILabel] {
        return [
            self.hpTitleLabel,
            self.atkTitleLabel,
            self.defTitleLabel,
            self.spAtkTitleLabel,
            self.spDefTitleLabel,
            self.spdTitleLabel
        ]
    }
    
    var statValueLabels: [UILabel] {
        return [
            self.hpValueLabel,
            self.atkValueLabel,
            self.defValueLabel,
            self.spAtkValueLabel,
            self.spDefValueLabel,
            self.spdValueLabel
        ]
    }
    
    var statBarView: [UIView] {
        return [
            self.hpTitleBarView,
            self.atkTitleBarView,
            self.defTitleBarView,
            self.spAtkTitleBarView,
            self.spDefTitleBarView,
            self.spdTitleBarView,
        ]
    }
    
    
    fileprivate lazy var stackViewLabelsContainer: UIStackView = {
        let view: UIStackView = UIStackView(arrangedSubviews: [
                self.hpTitleLabel,
                self.atkTitleLabel,
                self.defTitleLabel,
                self.spAtkTitleLabel,
                self.spDefTitleLabel,
                self.spdTitleLabel
            ])
        view.axis = .vertical
        view.spacing = 5
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        self.rpd.subviews(forAutoLayout: [
                self.stackViewLabelsContainer,
                self.hpTitleBarView,
                self.atkTitleBarView,
                self.defTitleBarView,
                self.spAtkTitleBarView,
                self.spDefTitleBarView,
                self.spdTitleBarView,
                self.hpValueLabel,
                self.atkValueLabel,
                self.defValueLabel,
                self.spAtkValueLabel,
                self.spDefValueLabel,
                self.spdValueLabel
            ])
        
        self.stackViewLabelsContainer.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(30.0)
            make.leading.equalToSuperview().offset(5.0)
            make.width.equalTo(100.0)
        }
        
        for (titleLabel, barView) in zip(self.statTitleLabels, self.statBarView){
            barView.snp.remakeConstraints{ (make: ConstraintMaker) -> Void in
                make.leading.equalTo(self.stackViewLabelsContainer.snp.trailing).offset(5.0)
                make.centerY.equalTo(titleLabel)
                make.height.equalTo(titleLabel)
                make.width.equalTo(50)
            }
        }
        
        for (valueLabel, barView) in zip(self.statValueLabels, self.statBarView){
            valueLabel.snp.remakeConstraints{ (make: ConstraintMaker) -> Void in
                make.leading.equalTo(barView.snp.trailing).offset(5.0)
                make.centerY.equalTo(barView)
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StatsCell: Configurable {
    static var identifier: String  = "StatCell"
    
    func configure(with statModel: StatModel) {
        let remainingWidth = self.bounds.width - 100 - 5.0 - 5.0 - 5.0
        let valuePerStatPoint = remainingWidth / 205
        
        let reversedStatsArray: [Stats] = statModel.pokemon.stats.reversed()
        var staValuesFloat: [CGFloat] = [CGFloat]()
        
        for (statValueLabel, stat) in zip(self.statValueLabels, reversedStatsArray){
            statValueLabel.text = "\(stat.baseStat)"
            print("\(stat.statDetail.name): \(valuePerStatPoint * CGFloat(stat.baseStat)) ")
            
            staValuesFloat.append(CGFloat(stat.baseStat))
        }
        
        for (barView, statFloatValue) in zip(statBarView, staValuesFloat){
            barView.snp.updateConstraints{ (make:ConstraintMaker) -> Void in
                make.width.equalTo(statFloatValue * valuePerStatPoint)
            }
        }
    }
}
