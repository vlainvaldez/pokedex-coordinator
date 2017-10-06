//
//  BasedConfiguration.swift
//  PokedexFFUF
//
//  Created by FFUF on 05/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import Foundation
import FSwiftNetworking

public struct BaseConfiguration: RequestConfiguration {
    public var scheme: URLScheme {
        return .http
    }
    
    public var host: String {
        return "pokeapi.co"
    }
    
    public var basePathComponents: [String] {
        return[
            "api",
            "v2"
        ]
    }
    
    public var baseHeaders: [String : Any] {
        return ["Content-type": "application/json"]
    }
    
    
}
