//
//  FSwiftNetworking
//  Created by Julio Miguel Alorro on 7/27/17.
//  Licensed under the MIT license. See LICENSE file
//

/**
 A Request contains the information required to make an http network request. A Request represents one network operation.
*/
public protocol Request: CustomStringConvertible, CustomDebugStringConvertible {
    /**
     The RequestConfiguration used by the Request
    */
    var configuration: RequestConfiguration { get }

    /**
     http method of the http request
    */
    var method: HTTPMethod { get }

    /**
     URL path to API Endpoint
    */
    var pathComponents: [String] { get }

    /**
     http parameters to be sent in the http network request body or as query string(s) in the URL
    */
    var parameters: [String: Any] { get }

    /**
     http headers to be sent with the http network request
    */
    var headers: [String: Any] { get }

}

public extension Request {

    var isGetRequest: Bool {
        return self.method == HTTPMethod.GET
    }

    var description: String {
        let strings: [String] = [
            "Method: \(self.method)",
            "PathComponents: \(self.pathComponents)",
            "Parameters: \(self.parameters)",
            "Headers: \(self.headers)"
        ]

        let descriptionString: String = strings.reduce("") { (result: String, string: String) -> String in
            return "\(result)\n\t\(string)"
        }
        return "Type: \(type(of: self)): \(descriptionString)"
    }

    var debugDescription: String {
        return self.description
    }
    
}
