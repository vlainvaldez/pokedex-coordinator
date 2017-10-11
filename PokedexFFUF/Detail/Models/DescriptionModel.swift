//
//  DescriptionModel.swift
//  PokedexFFUF
//
//  Created by FFUF on 11/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import Rapid
import IGListKit

public class DescriptionModel: JAObject{
    let pokemon: Pokemon
    let species: Species
    
    init(pokemon: Pokemon, species: Species){
        self.pokemon = pokemon
        self.species = species
    }
}

extension DescriptionModel: ListDiffable{
    public func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? DescriptionModel else { return false }
        
        return self.pokemon == object.pokemon  && self.species == object.species
    }
}
