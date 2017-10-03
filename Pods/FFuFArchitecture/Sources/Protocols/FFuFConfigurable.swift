//
//  FFuFArchitecture
//  Created by Julio Miguel Alorro on 9/28/17.
//  Licensed under the MIT license. See LICENSE file
//

import Foundation

/**
 An FFuFConfigurable type is a class instance that gets mutated by its Model type
*/
public protocol FFuFConfigurable: class {

    associatedtype Model: NSObject

    /**
     Method where you bind the information from the Model to the FFuFConfigurable instance (i.e. TextCell)
     - parameter _: The view model used to mutate the FFuFConfigurable's properties
    */
    func configure(with _: Model)
}
