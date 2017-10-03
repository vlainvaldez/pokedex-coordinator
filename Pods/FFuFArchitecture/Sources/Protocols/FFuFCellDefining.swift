//
//  FFuFArchitecture
//  Created by Julio Miguel Alorro on 9/28/17.
//  Licensed under the MIT license. See LICENSE file
//

import UIKit

/**
 A FFuFCellDefining type defines what subclass of BaseCell to use and what size that BaseCell should have
*/
public protocol FFuFCellDefining: class {

    /**
     The BaseCell subclass to instantiate when using this class
     */
    var cellType: BaseCell.Type { get }

    /**
     Size used for the cell. Call from sizeForItem method.
     */
    var sizeForCell: CGSize { get set }

}
