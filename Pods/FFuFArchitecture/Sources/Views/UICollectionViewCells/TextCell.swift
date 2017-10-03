//
//  FFuFArchitecture
//  Created by Julio Miguel Alorro on 9/28/17.
//  Licensed under the MIT license. See LICENSE file
//

import UIKit
import SnapKit

/**
 TextCell is a subclass of BaseCell that has a single UILabel which is used to display text from a TextItem instance.
 TextCell is a self sizing cell.
 */
open class TextCell: BaseCell {

    // MARK: Subviews
    /**
     The UILabel that displays the text contents of the view model
     */
    open var textLabel: UILabel = {
        let view: UILabel = UILabel()
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 16.0)
        view.lineBreakMode = NSLineBreakMode.byWordWrapping
        view.adjustsFontSizeToFitWidth = false
        view.numberOfLines = 0
        return view
    }()

    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)

        self.contentView.backgroundColor = UIColor.clear
        self.contentView.addSubview(self.textLabel)
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false

        self.textLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(2.0)
            make.leading.equalToSuperview().offset(2.0)
            make.trailing.equalToSuperview().inset(2.0)
            make.bottom.equalToSuperview().inset(2.0)
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Overidden UICollectionViewCell Methods
    open override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        self.setNeedsLayout()
        self.layoutIfNeeded()
        let size = self.contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame

        if let item = self.item {
            item.sizeForCell = newFrame.size
        }

        return layoutAttributes
    }

    // MARK: Stored Properties
    private var text: String = "" {
        didSet {
            self.textLabel.text = text
        }
    }

    // MARK: Overidden Instance Methods
    open override func configure(with item: BaseItem) {
        guard let item = item as? TextItem else { return }
        self.text = item.text
        self.item = item
    }

}
