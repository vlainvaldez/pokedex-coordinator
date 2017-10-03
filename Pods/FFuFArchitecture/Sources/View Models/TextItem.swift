//
//  FFuFArchitecture
//  Created by Julio Miguel Alorro on 9/28/17.
//  Licensed under the MIT license. See LICENSE file
//

import Foundation
import IGListKit

/**
 A BaseItem subclass that contains text information that will be displayed in its associated BaseCell subclass
*/
open class TextItem: BaseItem {

    // MARK: Initializer
    /**
     Initializer of a TextItem
     - parameter text: The string that will represent the text to be displayed by the Text Item
    */
    public init(text: String) {
        self.text = text
        super.init()
    }

    // MARK: Stored Properties
    /**
     Text to be displayed on the BaseCell or BaseCell subclass
     */
    open let text: String

    /**
     The size of the cell.
    */
    private var _sizeForCell: CGSize = CGSize.zero

    // MARK: Overidden Base Class Methods
    open override func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? TextItem else { return false }

        return self.text == object.text
    }
}

extension TextItem: FFuFCellDefining {

    // MARK: Computed Properties
    open var cellType: BaseCell.Type {
        return TextCell.self
    }

    open var sizeForCell: CGSize {
        get { return self._sizeForCell }

        set { self._sizeForCell = newValue }
    }

}
