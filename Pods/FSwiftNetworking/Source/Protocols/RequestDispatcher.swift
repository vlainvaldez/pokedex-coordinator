//
//  FSwiftNetworking
//  Created by Julio Miguel Alorro on 5/12/17.
//  Licensed under the MIT license. See LICENSE file
//

import Foundation
import BrightFutures

/**
 A RequestDispatcher uses the URLRequest of the RequestBuilder to make an
 http network request using the a URLSession instance.
*/
public protocol RequestDispatcher {
    /**
     The URLSession used for the RequestDispatcher type
    */
    static var session: URLSession { get }

    /**
     Initializer with a Request and RequestBuilder type
     - parameter request: The Request instance used to build a URLRequest in the RequestBuilder
     - parameter builderType: The type of RequestBuilder that will be initialized to create the URLRequest
     - parameter strategy: The DataStrategy used to create the body of the http request
     - parameter printsResponse: Indicates whether the HTTPURLResponse will be printed to the console or not
    */
    init(request: Request, builderType: RequestBuilder.Type, strategy: DataStrategy, printsResponse: Bool)

    /**
     Initializer using a RequestBuiler
     - parameter builder: The RequestBuilder instance used to build a URLRequest
     - parameter printsResponse: Indicates whether the HTTPURLResponse will be printed to the console or not
    */
    init(builder: RequestBuilder, printsResponse: Bool)

    /**
     The Request associated with the RequestDispatcher
    */
    var request: Request { get }

    /**
     The Request Builder associated with the RequestDispatcher
    */
    var builder: RequestBuilder { get }

    /**
     The URLRequest associated with the RequestDispatcher
    */
    var urlRequest: URLRequest { get }

    /**
     When set to true, the headers of the HTTPURLResponse is printed in the console log. Use for debugging purposes
    */
    var printsResponse: Bool { get }

    /**
     The method used to make an http network request by creating a URLSessionDataTask from the URLRequest instance.
     Returns a Future.
    */
    func dispatchURLRequest() -> Future<Response, NetworkingError>

    /**
     The method used to cancel the URLSessionDataTask created using the URLRequest
    */
    func cancelURLRequest()
}
