//
//  Pokedex.swift
//  Pokedex
//
//  Created by Pedro Grando on 18/11/22.
//

import Foundation
 

struct Pokemon: Codable {
    var id: Int
    var name: Language
    var type: [String]
    var base: Base
}
