//
//  MainVCDelegate.swift
//  PokedexFFUF
//
//  Created by FFUF on 05/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import UIKit

public protocol MainVCDelegate: class {
    func pokemonClicked(_ icon: PokemonIcon, view: MainView)
}
