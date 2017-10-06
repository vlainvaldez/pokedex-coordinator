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
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        self.rpd.subviews(forAutoLayout: [segmentControl])
        
        self.segmentControl.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(30.0)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
