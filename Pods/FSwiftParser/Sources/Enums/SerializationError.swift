//
//  SerializationError.swift
//  FSwiftParser
//
//  Created by Julio Miguel Alorro on 5/12/17.
//
//

import Foundation

public enum SerializationError: LocalizedError {

    case jsonSerializaionFailed(String)
    case missingKey(String)
    case typecastFailed(String)

    public var errorDescription: String? {
        switch self {
            case .jsonSerializaionFailed(let string):
                return string

            case .missingKey(let string):
                return string

            case .typecastFailed(let string):
                return string
        }
    }

    public var failureReason: String? {
        switch self {
            case .jsonSerializaionFailed(let string):
                return string

            case .missingKey(let string):
                return string

            case .typecastFailed(let string):
                return string
        }
    }
}
