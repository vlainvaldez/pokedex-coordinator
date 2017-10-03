//
//  ExpandableHeader.swift
//  FFuFArchitecture
//
//  Created by Julio Alorro on 9/28/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit

/**
 ExpandableSectionHeader is a supplementary view used a UICollectionElementKindSectionHeader. It consists of a UILabel
 and a ChevronView. It contains a UITapGestureRecognizer of the UILabel to notify its delegate when to expand or contract
 on the UICollectionView.
*/
open class ExpandableSectionHeader: UICollectionReusableView {

    // MARK: Subviews
    /**
     The UILabel that displays the text contents of its view model
    */
    open var textLabel: UILabel = {
        let view: UILabel = UILabel()
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 16.0)
        view.adjustsFontSizeToFitWidth = false
        view.numberOfLines = 1
        view.isUserInteractionEnabled = true
        return view
    }()

    /**
     The ChevronView that displays the direction of the chevron depending on if the section is expanded or contracted.
    */
    open var chevronView: ChevronView = {
        let view: ChevronView = ChevronView(frame: CGRect.zero, direction: ChevronView.Direction.down)
        view.lineColor = UIColor.black
        view.lineWidth = 2.0
        return view
    }()

    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(self.textLabel)
        self.addSubview(self.chevronView)
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.chevronView.translatesAutoresizingMaskIntoConstraints = false

        self.textLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview().inset(4.0).priority(750.0)
        }

        self.chevronView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.trailing.equalToSuperview().inset(10.0)
            make.centerY.equalToSuperview()
            make.size.equalTo(12.5)
        }

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(ExpandableSectionHeader.sectionHeaderTapped)
        )

        self.textLabel.addGestureRecognizer(tap)

    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Delegate Properties
    /**
     The delegate assigned to this header
    */
    open weak var delegate: ExpandableSectionHeaderDelegate!

    // MARK: Stored Properties
    /**
     The index of the section
    */
    open var section: Int = 0

    // MARK: Instance Methods
    /**
     The target action method used by the UITapGestureRecognizer
    */
    @objc open func sectionHeaderTapped() {
        self.delegate.sectionTapped(self.section)
    }
}

extension ExpandableSectionHeader: FFuFConfigurable {

    /**
     Method where you bind the information from the ExpandableItem to the ExpandableHeader's properties
     - parameter item: The ExpandableItem used to mutate the ExpandableHeader's properties
 */
    open func configure(with item: ExpandableItem) {
        self.textLabel.text = item.title
        switch item.isExpanded {
            case true:
                self.chevronView.direction = ChevronView.Direction.up

            case false:
                self.chevronView.direction = ChevronView.Direction.down
        }
    }

}
