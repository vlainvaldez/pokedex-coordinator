//
//  FSwiftNetworking
//  Created by Julio Miguel Alorro on 7/27/17.
//  Licensed under the MIT license. See LICENSE file
//

import Foundation
/**
 An implementation of Response that represents the data from an HTTPURLResponse.
*/
public struct JSONResponse {

    // MARK: Stored Properties
    fileprivate let _statusCode: Int
    fileprivate let _data: Data
    fileprivate let _json: JSON
}

extension JSONResponse: Response {

    // MARK: Initializer
    public init(httpResponse: HTTPURLResponse, data: Data) {
        self._statusCode = httpResponse.statusCode
        self._data = data
        self._json = JSON(data: data)
    }

    // MARK: Computed Properties
    public var statusCode: Int {
        return self._statusCode
    }

    public var data: Data {
        return self._data
    }

    public var json: JSON {
        return self._json
    }

}
