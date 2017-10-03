//
//  FFuFArchitecture
//  Created by Julio Miguel Alorro on 9/28/17.
//  Licensed under the MIT license. See LICENSE file
//

import Foundation
import IGListKit

/**
 The base class for all view models to be used by BaseSectionController or BaseExpandableSectionController.
*/
open class BaseItem: NSObject {}

extension BaseItem: ListDiffable {
    open func diffIdentifier() -> NSObjectProtocol {
        return self
    }

    open func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return self.isEqual(object)
    }
}
