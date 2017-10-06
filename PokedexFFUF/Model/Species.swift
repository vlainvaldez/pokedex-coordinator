//
//  Species.swift
//  PokedexFFUF
//
//  Created by FFUF on 05/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import FSwiftParser

fileprivate struct Version: Decodable {
    let name: String
}

fileprivate struct Language: Decodable{
    let name: String
}

fileprivate struct FlavorText: Decodable{
    let flavorText: String
    let language: Language
    let version: Version
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language = "language"
        case version
    }
}

fileprivate struct FlavorEntries: Decodable {
    let flavorEntries: [FlavorText]

    enum CodingKeys: String, CodingKey {
        case flavorEntries = "flavor_text_entries"
    }
}

public struct Species {
    
    let description: String
    
    public init(data: Data) throws {
        let decoder = JSONDecoder()
        let flavorEntries = try decoder.decode(FlavorEntries.self, from: data)
        let descriptionNode = flavorEntries.flavorEntries.filter({ (flavorText: FlavorText) -> Bool in
            return flavorText.language.name == "en" && flavorText.version.name == "alpha-sapphire"
        })
        
        guard let description = descriptionNode.first?.flavorText else { fatalError("No Nodes") }
        
        self.description = description
    }
}

