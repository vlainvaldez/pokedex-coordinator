//
//  FSwiftNetworking
//  Created by Julio Miguel Alorro on 7/27/17.
//  Licensed under the MIT license. See LICENSE file
//

import Foundation

/**
 A RequestBuilder uses the information of a Request to create an instance of URLRequest
*/
public protocol RequestBuilder {
    /**
     Initializer used to create a RequestBuilder
     - parameter request: The Request instance used to build a URLRequest
     - parameter strategy: The DataStrategy used to create the body of the http request
    */
    init(request: Request, strategy: DataStrategy)

    /**
     Request object's parameters as URLQueryItems
    */
    var queryItems: [URLQueryItem] { get }

    /**
     The http network request's URL built from the Request
    */
    var url: URL { get }

    /**
     Request object's parameters as Data
    */
    var httpBody: Data? { get }

    /**
     Combined headers of Request's Configuration and its headers
    */
    var headers: [String: Any] { get }

    /**
     The Request associated with the RequestBuilder
    */
    var request: Request { get }

    /**
     The URLRequest used when sending an http network request
    */
    var urlRequest: URLRequest { get }
}

public extension RequestBuilder {

    public var queryItems: [URLQueryItem] {
        return self.request.parameters.flatMap { (item: (key: String, value: Any)) -> URLQueryItem? in
            guard let value = item.value as? String
                else { return nil }

            return URLQueryItem(name: item.key, value: value)

        }
    }

    public var url: URL {
        var components: URLComponents = self.request.configuration.baseURLComponents

        let pathComponents: [String] = self.request.configuration.basePathComponents + self.request.pathComponents

        switch pathComponents.isEmpty {
            case true:
                break

            case false:
                var path: String = pathComponents.joined(separator: "/")

                switch path.characters.first! != "/" {
                    case true:
                        path.insert("/", at: path.startIndex)

                    case false:
                        break
                }

                components.path = path
        }

        switch self.request.isGetRequest && !self.queryItems.isEmpty {
            case true:
                components.queryItems = self.queryItems

            case false:
                break
        }

        guard let url = components.url
            else { fatalError("Invalid URL \(components)") }

        return url
    }

    public var headers: [String: Any] {
        let headersArray: [[String: Any]] = [self.request.configuration.baseHeaders, self.request.headers]

        return headersArray.reduce([:]) { (result: [String: Any], dict: [String : Any]) -> [String: Any] in
            var result: [String: Any] = result
            dict.forEach { (dict: (key: String, value: Any)) -> Void in
                result.updateValue(dict.value, forKey: dict.key)
            }

            return result
        }
    }

    public var urlRequest: URLRequest {
        var request: URLRequest = URLRequest(url: self.url)
        request.httpMethod = self.request.method.rawValue
        request.httpBody = self.httpBody

        self.headers.forEach { (key: String, value: Any) -> Void in
            if let value = value as? String {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }

        return request
    }

}

public extension RequestBuilder {
    var description: String {
        let strings: [String] = [
            "QueryItems: \(self.queryItems)",
            "URL: \(self.url)",
            "Http Body: \(String(describing: self.httpBody))",
            "Headers: \(self.headers)",
            "URLRequest: \(self.urlRequest)"
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
