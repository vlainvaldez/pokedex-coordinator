//
//  SpeciesRequest.swift
//  PokedexFFUF
//
//  Created by FFUF on 05/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import Foundation
import FSwiftNetworking

public struct SpeciesRequest {
    
    fileprivate let pokemonIcon: PokemonIcon
    
    init(pokemonIcon: PokemonIcon){
        self.pokemonIcon = pokemonIcon
    }
    
}

extension SpeciesRequest: Request{
    public var configuration: RequestConfiguration {
        return BaseConfiguration()
    }
    
    public var method: HTTPMethod {
        return .GET
    }
    
    public var pathComponents: [String] {
        return [
            "pokemon-species",
            "\(self.pokemonIcon.id)"
        ]
    }
    
    public var parameters: [String : Any] {
        return [:]
    }
    
    public var headers: [String : Any] {
        return [:]
    }
    
    
}
