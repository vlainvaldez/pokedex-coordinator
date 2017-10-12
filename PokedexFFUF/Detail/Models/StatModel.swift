//
//  StatModel.swift
//  PokedexFFUF
//
//  Created by FFUF on 12/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import Rapid
import IGListKit

public class StatModel: JAObject {
    let pokemon: Pokemon
    
    init(pokemon: Pokemon){
        self.pokemon = pokemon
    }
}

extension StatModel: ListDiffable{
    public func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? StatModel else { return false }
        
        return self.pokemon == object.pokemon
    }
}
