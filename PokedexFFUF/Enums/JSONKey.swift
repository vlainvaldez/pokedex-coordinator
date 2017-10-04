//
//  JSONKey.swift
//  PokedexFFUF
//
//  Created by FFUF on 04/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import Foundation

public enum JSONKey: String {
    case identifier
    
    case id
    case stats
    case forms
    case types
    case type
    case name
    case baseStat = "base_stat"
    case weight
    case height
    
    case flavorTexts = "flavor_text_entries"
    case flavorText = "flavor_text"
    case version
    case language
    
    case chain
    case evolutionDetails = "evolution_details"
    case evolvesTo = "evolves_to"
    case species
    
    case evolutionChain = "evolution_chain"
    case url
    case trigger
}
