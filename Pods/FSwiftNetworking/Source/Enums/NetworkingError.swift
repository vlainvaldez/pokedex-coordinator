//
//  FSwiftNetworking
//  Created by Julio Miguel Alorro on 5/12/17.
//  Licensed under the MIT license. See LICENSE file
//

import Foundation

/**
 An Enum that represents errors related to http network requests
 */
public enum NetworkingError: LocalizedError {
    /**
     Connection error
    */
    case connection(String)

    /**
     Response error
    */
    case response(Response)

    public var localizedDescription: String {
        return self.errorDescription!
    }

    public var errorDescription: String? {
        switch self {
            case .connection(let string):
                return string

            case .response(let response):
                return response.json.description
        }
    }

    public var failureReason: String? {
        return self.errorDescription
    }
}
