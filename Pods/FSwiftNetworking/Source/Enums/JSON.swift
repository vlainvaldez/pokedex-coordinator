//
//  FSwiftNetworking
//  Created by Julio Miguel Alorro on 7/27/17.
//  Licensed under the MIT license. See LICENSE file
//

import Foundation

/**
 The JSON enum represents the data from an http response as either an array of dictionaries or a single dictionary
 */
public enum JSON {
    /**
     JSON Array representation
    */
    case array([[String: Any]])

    /**
     JSON Dictionary representation
    */
    case dictionary([String: Any])

    /**
     Not a JSON representation
    */
    case unknown(String)

    /**
     The initializer of a JSON enum
    */
    public init(data: Data) {
        do {
            let json: Any = try JSONSerialization.jsonObject(with: data)

            switch json {
                case let jsonDict as [String: Any]:
                    self = JSON.dictionary(jsonDict)

                case let jsonArray as [[String: Any]]:
                    self = JSON.array(jsonArray)

                default:
                    let stringValue: String

                    if let str = String(data: data, encoding: String.Encoding.utf8) {

                        stringValue = str

                    } else {

                        stringValue = "JSON serialized but not an array or dictionary"

                    }

                    self = JSON.unknown(stringValue)
            }
        } catch {
            let errorString: String

            if let str: String = String(data: data, encoding: String.Encoding.utf8) {

                errorString = str

            } else {

                errorString = "Unknown Error. Could not convert data to string"
                
            }
            
            self = JSON.unknown(
                errorString + "\n\(error.localizedDescription)"
            )
        }
    }

    /**
     Returns the array of the .array case, otherwise induces a fatalError
    */
    public var arrayValue: [[String: Any]] {
        switch self {
            case .array(let array):
                return array

            case .dictionary, .unknown:
                fatalError("Not an Array value")
        }
    }

    /**
     Returns the dictionary of the .dictionary case, otherwise induces a fatalError
    */
    public var dictValue: [String: Any] {
        switch self {
            case .dictionary(let dict):
                return dict

            case .array, .unknown:
                fatalError("Not a Dictionary value")
        }
    }
}

extension JSON: CustomStringConvertible {
    public var description: String {
        switch self {
            case .array(let array):
                return "Array: \(array)"

            case .dictionary(let dict):
                return "Dictionary: \(dict)"

            case .unknown(let string):
                return string
        }
    }
}

extension JSON: CustomDebugStringConvertible {
    public var debugDescription: String {
        return self.description
    }
}
