//
//  EvolutionChainRequest.swift
//  PokedexFFUF
//
//  Created by FFUF on 10/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import FSwiftNetworking

public struct EvolutionRequest {
    
    //MARK: Stored Properties
    fileprivate let id: String
    
    init(url: URL) {
        self.id = url.lastPathComponent
    }
}

extension EvolutionRequest: Request{
    public var configuration: RequestConfiguration {
        return BaseConfiguration()
    }
    
    public var method: HTTPMethod {
        return HTTPMethod.GET
    }
    
    public var pathComponents: [String] {
        return [
            "evolution-chain",
            "\(self.id)"
        ]
    }
    
    public var parameters: [String : Any] {
        return [:]
    }
    
    public var headers: [String : Any] {
        return [:]
    }
    
    
}
