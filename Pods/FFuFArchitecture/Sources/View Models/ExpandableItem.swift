//
//  FFuFArchitecture
//  Created by Julio Miguel Alorro on 9/28/17.
//  Licensed under the MIT license. See LICENSE file
//

import Foundation
import IGListKit

/**
 A BaseItem subclass that is used to represent an ExpandableSectionController.
*/
open class ExpandableItem: BaseItem {

    // MARK: Initializer
    /**
     Initializer for ExpandableItem
     - parameter title: The title of the header
     - parameter items: The items used to represent the cells in the section
    */
    public init(title: String, items: [CellDefiningBaseItem]) {
        self.title = title
        self.items = items
        super.init()
    }

    // MARK: Stored Properties
    /**
     The title to be displayed on the ExpandableHeader instance
     */
    open let title: String

    /**
     The items to be used to display data on subsequent BaseCells after ExpandableHeaderView
     */
    open let items: [CellDefiningBaseItem]

    /**
     Bool for isExpanded
     */
    open var isExpanded: Bool = false

}
