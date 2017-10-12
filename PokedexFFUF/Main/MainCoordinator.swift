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
import BrightFutures

public final class MainCoordinator: AbstractCoordinator {
    
    fileprivate unowned let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    public override func start() {        
        
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
        
        pokemonRequestDispatcher.dispatchURLRequest().map { (pokemonResponse) -> Pokemon in
            do{
                 return try Pokemon(data: pokemonResponse.data)
            }catch{
                fatalError(error.localizedDescription)
            }
        }.map { (pokemon:Pokemon) -> Void in
            
            speciesRequestDispatcher.dispatchURLRequest().map { (speciesResponse) -> Species in
                do{
                    let species = try Species(data: speciesResponse.data)
                    return species
                }catch {
                    fatalError(error.localizedDescription)
                }
            }.map{ (species: Species) -> Future<(Species,Evolution), NetworkingError> in
                    let evolutionRequest: EvolutionRequest = EvolutionRequest(url: species.evolutionURL)
                    
                    let evolutionRequestDispatcher: RequestDispatcher = JSONRequestDispatcher(request: evolutionRequest, builderType: JSONRequestBuilder.self, printsResponse: true)
                    
                    return evolutionRequestDispatcher.dispatchURLRequest()
                        .map { (evolutionResponse: Response) -> (Species, Evolution) in
                            do{
                                let evolution: Evolution = try Evolution(data: evolutionResponse.data)
                                
                                return (species, evolution)
                                
                            }catch {
                                fatalError(error.localizedDescription)
                            }
                    }
                }
                .flatMap{ (future: Future<(Species, Evolution), NetworkingError >) -> Future<(Pokemon, Species, Evolution), NetworkingError> in
                    
                    return future.map { (objects: (species: Species, evolution: Evolution)) -> (Pokemon, Species, Evolution) in
                        
                        return (pokemon, objects.species, objects.evolution)
                    }
                }
                .onSuccess { (objects: (pokemon: Pokemon, species: Species, evolution: Evolution)) -> Void in
                    
                    let coordinator: DetailCoordinator = DetailCoordinator(
                        delegate: self,
                        navigationController:
                        self.navigationController,
                        models: DetailModels(
                            descriptionModel: DescriptionModel(
                                pokemon: objects.pokemon,
                                species: objects.species,
                                evolution: objects.evolution),
                            statModel: StatModel(pokemon: objects.pokemon)
                        )
                    )
                    
                    self.add(childCoordinator: coordinator)
                    DispatchQueue.main.async {
                        coordinator.start()
                    }
                }.onComplete { (result) in
                    DispatchQueue.main.async {
                        print("on complete")
                        view.stopLoadingIndicatorView()
                    }
            }
                
        }.onFailure { (error: NetworkingError) -> Void in
            print("Error: \(error.localizedDescription)")
        }
    }
}

extension MainCoordinator: DetailCoordinatorDelegate {
    func detailCoordinatorDismissView(_ coordinator: DetailCoordinator) {
        print("must deallocate")
        self.remove(childCoordinator: coordinator)
    }
}


