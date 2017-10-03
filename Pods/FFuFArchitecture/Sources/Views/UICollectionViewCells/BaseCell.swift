//
//  FFuFArchitecture
//  Created by Julio Miguel Alorro on 9/28/17.
//  Licensed under the MIT license. See LICENSE file
//

import UIKit

/**
 The base class for all cells to be used by BaseSectionController or BaseExpandableSectionController.
 Is of type FFuFConfigurable so it can be mutated by a BaseItem.
 */
open class BaseCell: UICollectionViewCell, FFuFConfigurable {

    // MARK: Overridden UICollectionViewCell Methods
    open override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        self.setNeedsLayout()
        self.layoutIfNeeded()
        let size = self.contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        newFrame.size.width = ceil(size.width)
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame

        if let item = self.item {
            item.sizeForCell = newFrame.size
        }

        return layoutAttributes
    }

    // MARK: Stored Properties
    /**
     The CellDefiningBaseItem instance that is used to modify this instance
     */
    open weak var item: CellDefiningBaseItem!

    /**
     The index of the cell in the section
     */
    open var index: Int!

    // MARK: Instance Methods
    /**
     Method where you bind the information from the BaseItem to the BaseCell's properties
     - parameter item: The view model used to mutate the BaseCell's properties
     */
    open func configure(with item: BaseItem) {
        fatalError("Override this")
    }

}
