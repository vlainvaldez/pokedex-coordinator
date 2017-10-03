//
//  FSwiftNetworking
//  Created by Julio Miguel Alorro on 8/23/17.
//  Licensed under the MIT license. See LICENSE file
//

import Foundation

/**
 An implementation of DataStrategy that is suited for a Content-Type of application/json for the body of an http request
*/
public struct JSONStrategy: DataStrategy {

    public init() {}

    public func createHTTPBody(from dict: [String: Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: dict)
    }

}
