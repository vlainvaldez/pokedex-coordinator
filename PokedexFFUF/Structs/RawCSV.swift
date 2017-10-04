//
//  RawCSV.swift
//  PokedexFFUF
//
//  Created by FFUF on 04/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import Foundation


struct RawCSV {
    
    let headers: [String]
    var rows: [[String: Any]] = []
    var columns: [String: [Any]] = [:]
    
    fileprivate static let delimiter: String = ","
    
    init(filePath: String?) throws {
        
        guard let path = filePath
            else { throw CSVError.invalidFilePath(filePath) }
        
        do {
            
            var csvArray: [String] = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
                .components(separatedBy: CharacterSet.newlines)
                .filter { $0.isEmpty == false }
            
            
            self.headers = csvArray.remove(at: 0).components(separatedBy: RawCSV.delimiter)
            
            self.headers.forEach {
                
                self.columns[$0] = []
            }
            
            csvArray.forEach {
                
                let rowDataArray: [String] = $0.components(separatedBy: RawCSV.delimiter)
                var row: [String: Any] = [:]
                
                print(rowDataArray)
                
                self.headers.enumerated().forEach { (i: Int, header: String) in
                    
                    row[header] = rowDataArray[i]
                    
                    self.columns[header]?.append(rowDataArray[i])
                }
                
                self.rows.append(row)
            }
            
        } catch let error {
            
            throw error
            
        }
    }
}
