//
//  MainCoordinator.swift
//  PokedexFFUF
//
//  Created by FFUF on 02/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import UIKit
import Rapid
import FSwiftNetworking
import FSwiftParser

public final class MainCoordinator: AbstractCoordinator {
    
    fileprivate unowned let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    public override func start() {
        self.navigationController.navigationBar.barTintColor = UIColor.yellow
        let csvPath: String? = Bundle.main.path(forResource: "pokemon", ofType: "csv")
        
        do {
            
            let rawCSV: RawCSV = try RawCSV(filePath: csvPath)
            let objects: [PokemonIcon] = rawCSV.rows.map { PokemonIcon(dict: $0) }
            
            let vc: Mainvc = Mainvc(delegate: self, objects: objects)
            self.navigationController.viewControllers = [vc]
            
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
}

extension MainCoordinator: MainVCDelegate{
    public func pokemonClicked(_ icon: PokemonIcon, view: MainView) {
        let pokemonRequest: PokemonRequest = PokemonRequest(pokemonIcon: icon)
        let speciesRequest: SpeciesRequest = SpeciesRequest(pokemonIcon: icon)
        
        let pokemonRequestDispatcher: RequestDispatcher = JSONRequestDispatcher(request: pokemonRequest, builderType: JSONRequestBuilder.self, printsResponse: true)
        
        let speciesRequestDispatcher: RequestDispatcher = JSONRequestDispatcher(request: speciesRequest, builderType: JSONRequestBuilder.self, printsResponse: true)
        
        
        speciesRequestDispatcher.dispatchURLRequest().map { (speciesResponse) -> Void in
            
            
            do{
                let species = try Species(data: speciesResponse.data)
                
                print(species.description)
                
            }catch {
                fatalError(error.localizedDescription)
            }
            
        }
        
        
    }
}


