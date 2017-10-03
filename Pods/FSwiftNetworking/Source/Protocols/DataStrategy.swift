//
//  FSwiftNetworking
//  Created by Julio Miguel Alorro on 8/23/17.
//  Licensed under the MIT license. See LICENSE file
//

import Foundation

/**
 A DataStrategy defines the steps used to create the body for an http request
*/
public protocol DataStrategy {

    /**
     The method transforms the object instance into an optional Data
     - parameter object: The object to be transformed in to Data
    */
    func createHTTPBody(from dict: [String: Any]) -> Data?

}
