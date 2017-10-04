//
//  PokemonIcon.swift
//  PokedexFFUF
//
//  Created by FFUF on 04/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import Foundation
import Rapid
import IGListKit

public class PokemonIcon: JAObject {
    
    let id: String
    let name: String
    
    init(dict: [String: Any]) {
        
        print(dict)
        
        let dict: ReadOnlyDictionary<JSONKey, Any> = ReadOnlyDictionary<JSONKey, Any>(dict)
        
        self.id = dict[JSONKey.id] as! String
        self.name = dict[JSONKey.identifier] as! String
    }
    
}

extension PokemonIcon: ListDiffable {
    public func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        
        guard let object = object as? PokemonIcon else { return false }
        
        return self.id == object.id && self.name == object.name
    }
    
    
}
