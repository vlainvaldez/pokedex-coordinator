//
//  CSVError.swift
//  PokedexFFUF
//
//  Created by FFUF on 04/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import Foundation
public enum CSVError: Error {
    
    public var title: String {
        
        let stringValue: String = "\(self)".splitBefore(separator: {$0.isUpperCase})
            .map { String($0).capitalized }
            .joined(separator: " ")
        
        return CSVError.trimAssociatedValue(stringValue: stringValue)
        
    }
    
    public var localizedDescription: String {
//        print(self)
        switch self {
            
        case .invalidFilePath(let path):
            guard let path = path else { return "No Path" }
            
            return "Invalid path: \(path)"
        }
        
    }
    
    case invalidFilePath(String?)
    
    static fileprivate func trimAssociatedValue(stringValue: String) -> String {
        let range: Range<String.Index> = stringValue.range(of: "\\s\\(.*\\)", options: String.CompareOptions.regularExpression)!
        return String(stringValue[..<range.lowerBound])
    }
    
}
