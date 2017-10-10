//
//  Evolution.swift
//  PokedexFFUF
//
//  Created by FFUF on 10/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import FSwiftParser

fileprivate struct Specie: Decodable {
    let url: URL
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case url
        case name
    }
}

fileprivate struct EvolutionStats: Decodable{
    let minLevel: Int
    
    enum CodingKeys: String, CodingKey{
        case minLevel = "min_level"
    }
}

fileprivate struct EvolutionDetails: Decodable{
    let evolutionStat: [EvolutionDetails]
    let species: Specie
    
    enum CodingKeys: String, CodingKey{
        case evolutionStat = "evolves_to"
        case species
    }
}

fileprivate struct NextEvolution: Decodable {
    let specie: Specie
    let evolvesTo: [EvolutionDetails]?
    
    enum CodingKeys: String, CodingKey {
        case specie = "species"
        case evolvesTo = "evolves_to"
    }
}

fileprivate struct ChainEvolution: Decodable {
    let chain: NextEvolution
    
    enum CodingKeys: String, CodingKey {
        case chain = "chain"
    }
}

public struct Evolution: Parseable {
    
    var nodes: [EvolutionNode] = [EvolutionNode]()
    
    fileprivate static func chainParser(with nextEvolution: [EvolutionDetails] ){
        
        guard let name = nextEvolution.first?.species.name else {return}
        guard let url = nextEvolution.first?.species.url else {return}
        
        print("ID \(Int(url.lastPathComponent) ?? 0) NAME \(name)")
        
        if nextEvolution.first?.evolutionStat != nil {
            Evolution.chainParser(with: (nextEvolution.first?.evolutionStat)!)
        }
    }
    
    
    public init(data: Data) throws {
        do{
           let evolutionNode = try JSONDecoder().decode(ChainEvolution.self, from: data)
            let pokemonId: Int = Int(evolutionNode.chain.specie.url.lastPathComponent)!
            let pokemonName: String = evolutionNode.chain.specie.name
            print("FIRST: \(pokemonName)")
            self.nodes.append(EvolutionNode(id: pokemonId, name: pokemonName))
            
            if evolutionNode.chain.evolvesTo != nil {
                if !(evolutionNode.chain.evolvesTo?.isEmpty)!{
                    Evolution.chainParser(with: evolutionNode.chain.evolvesTo!)
                }
            }
            
        }catch{
            fatalError(error.localizedDescription)
        }
        
    }
}
