//
//  ParseJson.swift
//  Pokedex
//
//  Created by Pedro Grando on 21/11/22.
//

import Foundation
func parseJson() -> [Pokemon]{
    
    var finalPokemon: [Pokemon] = []
    let jsonPath = Bundle.main.url(forResource: "pokedex", withExtension: "json")
    if let path = jsonPath {
        let jsonData = try? Data(contentsOf: path)
        if let data = jsonData {
            let decoder = JSONDecoder()
            let pokemon = try! decoder.decode([Pokemon].self, from: data)
            finalPokemon = pokemon
        }
        
    }
    
    return finalPokemon
}
