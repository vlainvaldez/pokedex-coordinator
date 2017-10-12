//
//  Pokemon.swift
//  PokedexFFUF
//
//  Created by FFUF on 11/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import FSwiftParser
import IGListKit
import Rapid

struct StatDetail: Decodable {
    let url: String
    let name: String
}

struct Stats: Decodable {
    let statDetail: StatDetail
    let effort: Int
    let baseStat: Int
    
    enum CodingKeys: String, CodingKey {
        case statDetail = "stat"
        case effort
        case baseStat = "base_stat"
    }
}


struct TypeDetail: Decodable {
    let name: String
}


struct Types: Decodable {
    let slot: Int
    let typeDetail: TypeDetail
    
    enum CodingKeys: String, CodingKey {
        case slot
        case typeDetail = "type"
    }
    
}

fileprivate struct PokemonDecodable: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [Types]
    let stats: [Stats]
}

public class Pokemon: JAObject {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [Types]
    let stats: [Stats]
    
    public required init(data: Data) throws {
        do{
            let pokemonDecodable = try JSONDecoder().decode(PokemonDecodable.self, from: data)
            
            self.id = pokemonDecodable.id
            self.name = pokemonDecodable.name
            self.height = pokemonDecodable.height
            self.weight = pokemonDecodable.weight
            self.types = pokemonDecodable.types
            self.stats = pokemonDecodable.stats
            
        }catch {
            fatalError(error.localizedDescription)
        }
    }
}

extension Pokemon: ListDiffable {
    public func diffIdentifier() -> NSObjectProtocol {
         return self
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Pokemon else { return false }
        
        return self.id == object.id && self.name == object.name && self.height == object.height && self.weight == object.weight
    }
    
    
}
