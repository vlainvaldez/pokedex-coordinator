//
//  Pokemon.swift
//  PokedexFFUF
//
//  Created by FFUF on 11/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import FSwiftParser





public struct Pokemon: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
}
