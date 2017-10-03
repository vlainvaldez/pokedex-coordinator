//
//  FSwiftNetworking
//  Created by Julio Miguel Alorro on 7/27/17.
//  Licensed under the MIT license. See LICENSE file
//

import Foundation

/**
 An implementation of RequestBuilder that can build URLRequests for simple http network requests.
*/
public struct JSONRequestBuilder {

    // MARK: Stored Properties
    fileprivate let _request: Request
    fileprivate let _strategy: DataStrategy

}

// MARK: - RequestBuilder Protocol
extension JSONRequestBuilder: RequestBuilder {

    // MARK: Initializer
    public init(request: Request, strategy: DataStrategy) {
        self._request = request
        self._strategy = strategy
    }

    // MARK: Computed Properties
    public var httpBody: Data? {
        if self.request.parameters.isEmpty || self.request.isGetRequest {
            return nil
        }

        return self._strategy.createHTTPBody(from: self.request.parameters)
    }

    public var request: Request {
        return self._request
    }
    
}
