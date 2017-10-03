//
//  Parseable.swift
//  FSwiftParser
//
//  Created by Julio Alorro on 5/12/17.
//
//

import Foundation

fileprivate enum ErrorText: String {
    case missing = "key does not exist within JSON node"
    case typecast = "Typecasting failed"
    case data = "Data could not be serialized"
}

public protocol Parseable {

    /**
     Required intializer to be Parseable
    */
    init(data: Data) throws

    /**
     The createJSON method is a generic function that converts Data into a valid JSON object using
     the JSONSerialization jsonObjectWithData method and typecasts it into an array or dictionary.
     Throws an error.
     - parameter data: Data to be converted into a valid JSON object (Array or Dictionary)
     */
    static func createJSON<T>(with data: Data) throws -> T

    /**
     The value method converts a value of a [String: Any] dictionary into a declared type or throws a SerializationError.
     - parameter dict: The dictionary to be parsed
     - parameter key: The enum case of a String enum
     */
    static func value<T, K: RawRepresentable>(of dict: [String: Any], forKey key: K) throws -> T where K.RawValue == String

    /**
     The maybe method converts a value of a [String: Any] dictionary into a declared optional type or returns nil.
     - parameter dict: The dictionary to be parsed
     - parameter key: The enum case of a String enum
    */
    static func maybe<T, K: RawRepresentable>(of dict: [String: Any], forKey key: K) -> T? where K.RawValue == String
}

public extension Parseable {

    public static func createJSON<T>(with data: Data) throws -> T {
        do {
            let json: Any = try JSONSerialization.jsonObject(with: data)

            guard let object = json as? T
                else { throw SerializationError.typecastFailed(ErrorText.typecast.rawValue + " to JSON from data") }

            return object

        } catch {

            throw SerializationError.jsonSerializaionFailed(ErrorText.data.rawValue)

        }
    }

    public static func value<T, K: RawRepresentable>(of dict: [String: Any], forKey key: K) throws -> T where K.RawValue == String {
        guard dict[key.rawValue] != nil
            else { throw SerializationError.missingKey("\(key) \(ErrorText.missing.rawValue)") }

        guard let value = dict[key.rawValue] as? T
            else {
                throw SerializationError.typecastFailed(
                    ErrorText.typecast.rawValue + " to \(T.self) with \(key) key in \(dict)"
                )
            }

        return value
    }

    public static func maybe<T, K: RawRepresentable>(of dict: [String: Any], forKey key: K) -> T? where K.RawValue == String {
        guard dict[key.rawValue] != nil else { return nil }

        guard let value = dict[key.rawValue] as? T else { return nil }

        return value
    }
}
