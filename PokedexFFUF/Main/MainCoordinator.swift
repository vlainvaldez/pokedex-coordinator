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
import FFuFArchitecture

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
    public func infoClicked() {
        let vc: InfoVC = InfoVC(items: [
            TextItem(text: "Lorem ipsum keme keme keme 48 years dites lulu ang planggana kirara guash cheapangga nang wasok borta kabog chopopo bonggakea na ang bakit bakit lorem ipsum keme keme mahogany at nang sudems thunder nakakalurky na ang kasi planggana at ang daki ang wrangler shonget otoko na ang jowabelles fayatollah kumenis at ang matod planggana doonek planggana sangkatuts mabaho juts daki shontis chipipay keme sa mahogany juts at bakit wasok na shonga , shonga-shonga jowa bokot sangkatuts bokot biway buya Gino Mike chopopo majubis ng shonget kasi shonga ang tanders chopopo bakit jowabelles Cholo tetetet oblation sa lorem ipsum keme keme juts ng pamenthol kabog sa majubis otoko shonget mabaho pranella jowabelles oblation bokot lulu jowabella mashumers na ang ang tamalis , klapeypey-klapeypey."),
            // swiftlint:disable:next line_length
            TextItem(text: "Lorem ipsum keme keme keme 48 years dites lulu ang planggana kirara guash cheapangga nang wasok borta kabog chopopo bonggakea na ang bakit bakit lorem ipsum keme keme mahogany at nang sudems thunder nakakalurky na ang kasi planggana at ang daki ang wrangler shonget otoko na ang jowabelles fayatollah kumenis at ang matod planggana doonek planggana sangkatuts mabaho juts daki shontis chipipay keme sa mahogany juts at bakit wasok na shonga , shonga-shonga jowa bokot sangkatuts bokot biway buya Gino Mike chopopo majubis ng shonget kasi shonga ang tanders chopopo bakit jowabelles Cholo tetetet oblation sa lorem ipsum keme keme juts ng pamenthol kabog sa majubis otoko shonget mabaho pranella jowabelles oblation bokot lulu jowabella mashumers na ang ang tamalis , klapeypey-klapeypey."),
            ExpandableItem(
                title: "A First Title",
                items: [
                    // swiftlint:disable:next line_length
                    TextItem(text: "Lorem ipsum keme keme keme 48 years dites lulu ang planggana kirara guash cheapangga nang wasok borta kabog chopopo bonggakea na ang bakit bakit lorem ipsum keme keme mahogany at nang sudems thunder nakakalurky na ang kasi planggana at ang daki ang wrangler shonget otoko na ang jowabelles fayatollah kumenis at ang matod planggana doonek planggana sangkatuts mabaho juts daki shontis chipipay keme sa mahogany juts at bakit wasok na shonga , shonga-shonga jowa bokot sangkatuts bokot biway buya Gino Mike chopopo majubis ng shonget kasi shonga ang tanders chopopo bakit jowabelles Cholo tetetet oblation sa lorem ipsum keme keme juts ng pamenthol kabog sa majubis otoko shonget mabaho pranella jowabelles oblation bokot lulu jowabella mashumers na ang ang tamalis , klapeypey-klapeypey."),
                    // swiftlint:disable:next line_length
                    TextItem(text: "Lorem ipsum keme keme keme 48 years dites lulu ang planggana kirara guash cheapangga nang wasok borta kabog chopopo bonggakea na ang bakit bakit lorem ipsum keme keme mahogany at nang sudems thunder nakakalurky na ang kasi planggana at ang daki ang wrangler shonget otoko na ang jowabelles fayatollah kumenis at ang matod planggana doonek planggana sangkatuts mabaho juts daki shontis chipipay keme sa mahogany juts at bakit wasok na shonga , shonga-shonga jowa bokot sangkatuts bokot biway buya Gino Mike chopopo majubis ng shonget kasi shonga ang tanders chopopo bakit jowabelles Cholo tetetet oblation sa lorem ipsum keme keme juts ng pamenthol kabog sa majubis otoko shonget mabaho pranella jowabelles oblation bokot lulu jowabella mashumers na ang ang tamalis , klapeypey-klapeypey."),
                    // swiftlint:disable:next line_length
                    TextItem(text: "Lorem ipsum keme keme keme 48 years dites lulu ang planggana kirara guash cheapangga nang wasok borta kabog chopopo bonggakea na ang bakit bakit lorem ipsum keme keme mahogany at nang sudems thunder nakakalurky na ang kasi planggana at ang daki ang wrangler shonget otoko na ang jowabelles fayatollah kumenis at ang matod planggana doonek planggana sangkatuts mabaho juts daki shontis chipipay keme sa mahogany juts at bakit wasok na shonga , shonga-shonga jowa bokot sangkatuts bokot biway buya Gino Mike chopopo majubis ng shonget kasi shonga ang tanders chopopo bakit jowabelles Cholo tetetet oblation sa lorem ipsum keme keme juts ng pamenthol kabog sa majubis otoko shonget mabaho pranella jowabelles oblation bokot lulu jowabella mashumers na ang ang tamalis , klapeypey-klapeypey.")
                ]
            ),
            ExpandableItem(
                title: "A Second Title",
                items: [
                    // swiftlint:disable:next line_length
                    TextItem(text: "Bacon ipsum dolor amet venison jowl turducken, swine tail chicken kielbasa ham hock sausage. Landjaeger chuck swine alcatra pancetta sausage. Ham ball tip jowl jerky short ribs turducken sirloin chicken doner andouille tongue cow. Brisket pork chop jerky chicken, pork loin tri-tip ground round venison kielbasa drumstick beef tail landjaeger ball tip."),
                    // swiftlint:disable:next line_length
                    TextItem(text: "Filet mignon strip steak ham, short ribs pastrami short loin tenderloin chicken rump frankfurter picanha ball tip cupim. Bresaola beef filet mignon chicken shoulder ham hock. Tail ribeye meatball t-bone short ribs kielbasa. Pastrami burgdoggen beef ribs frankfurter, picanha capicola ham hock bresaola rump t-bone ground round sirloin ham. Bacon picanha jowl drumstick short ribs biltong landjaeger kielbasa ribeye pork loin meatloaf sausage sirloin shankle. Pastrami meatball andouille short ribs shoulder alcatra porchetta hamburger ham.\n\nSausage bresaola meatball pig pork belly porchetta ham hock frankfurter hamburger pork loin meatloaf flank shoulder ground round t-bone. Jowl andouille ribeye pig t-bone. Alcatra pork loin shankle short ribs swine bacon shank flank turducken tongue. Cupim kevin tail frankfurter biltong sausage."),
                    // swiftlint:disable:next line_length
                    TextItem(text: "Bacon ipsum dolor amet venison jowl turducken, swine tail chicken kielbasa ham hock sausage. Landjaeger chuck swine alcatra pancetta sausage. Ham ball tip jowl jerky short ribs turducken sirloin chicken doner andouille tongue cow. Brisket pork chop jerky chicken, pork loin tri-tip ground round venison kielbasa drumstick beef tail landjaeger ball tip.\n\nFilet mignon strip steak ham, short ribs pastrami short loin tenderloin chicken rump frankfurter picanha ball tip cupim. Bresaola beef filet mignon chicken shoulder ham hock. Tail ribeye meatball t-bone short ribs kielbasa. Pastrami burgdoggen beef ribs frankfurter, picanha capicola ham hock bresaola rump t-bone ground round sirloin ham. Bacon picanha jowl drumstick short ribs biltong landjaeger kielbasa ribeye pork loin meatloaf sausage sirloin shankle. Pastrami meatball andouille short ribs shoulder alcatra porchetta hamburger ham.\n\nSausage bresaola meatball pig pork belly porchetta ham hock frankfurter hamburger pork loin meatloaf flank shoulder ground round t-bone. Jowl andouille ribeye pig t-bone. Alcatra pork loin shankle short ribs swine bacon shank flank turducken tongue. Cupim kevin tail frankfurter biltong sausage.\n\nDrumstick cupim shank boudin andouille. Bresaola flank pig capicola cow ribeye. Picanha shankle pancetta, short loin chuck porchetta t-bone pork belly tenderloin leberkas chicken jowl. Drumstick boudin salami, meatball cow sirloin cupim biltong meatloaf bacon shoulder corned beef frankfurter.\n\nRibeye drumstick pork belly tenderloin, swine bresaola corned beef. Pancetta pork chop porchetta bacon, landjaeger chuck filet mignon strip steak sausage tri-tip. Pig brisket chicken shankle. Pork loin rump pig andouille corned beef swine biltong turducken alcatra bresaola.\n\nDoes your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!")
                ]
            )
            
            ])
        
        vc.view.backgroundColor = UIColor.white
        DispatchQueue.main.async {
            self.navigationController.pushViewController(vc, animated: true)
        }
        
    }
    
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
            view.stopLoadingIndicatorView()
            print("Error: \(error.localizedDescription)")
        }
    }
}

extension MainCoordinator: DetailCoordinatorDelegate {
    func detailCoordinatorDismissView(_ coordinator: DetailCoordinator) {
        print("must deallocate")
        self.remove(childCoordinator: coordinator)
        self.navigationController.navigationBar.barTintColor = CustomColors.red
        
    }
}


