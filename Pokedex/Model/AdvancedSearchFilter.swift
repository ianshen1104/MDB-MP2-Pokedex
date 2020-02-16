//
//  AdvancedSearchFilter.swift
//  Pokedex
//
//  Created by Ian Shen on 2/15/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation

class AdvancedSearchFilter {
    var selectedTypes : [PokeType]
    var minAtk : Int
    var maxAtk : Int
    var minDef : Int
    var maxDef : Int
    var minHp : Int
    var maxHp : Int
    var minSpeAtk : Int
    var maxSpeAtk : Int
    var minSpeDef : Int
    var maxSpeDef : Int
    var minSpeed : Int
    var maxSpeed : Int
    var minTotal : Int
    var maxTotal : Int
    
    init() {
        minAtk = 0
        maxAtk = Int.max
        minDef = 0
        maxDef = Int.max
        minHp = 0
        maxHp = Int.max
        minSpeAtk = 0
        maxSpeAtk = Int.max
        minSpeDef = 0
        maxSpeDef = Int.max
        minSpeed = 0
        maxSpeed = Int.max
        minTotal = 0
        maxTotal = Int.max
        selectedTypes = []
    }
    
    func filterPokemon (_ pokemon : Pokemon) -> Bool {
        for type in pokemon.types {
            if !selectedTypes.contains(type) {
                return false
            }
        }
        if pokemon.attack < minAtk || pokemon.attack > maxAtk {
            return false
        }
        if pokemon.defense < minDef || pokemon.defense > maxDef {
            return false
        }
        if pokemon.health < minHp || pokemon.health > maxHp {
            return false
        }
        if pokemon.specialAttack < minSpeAtk || pokemon.specialAttack > maxSpeAtk {
            return false
        }
        if pokemon.specialDefense < minSpeDef || pokemon.specialDefense > maxSpeDef {
            return false
        }
        if pokemon.speed < minSpeed || pokemon.speed > maxSpeed {
            return false
        }
        if pokemon.total < minTotal || pokemon.total > maxTotal {
            return false
        }
        return true
    }
}
