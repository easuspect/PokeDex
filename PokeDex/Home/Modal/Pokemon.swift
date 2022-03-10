//
//  Pokemon.swift
//  PokeDex
//
//  Created by NewMac on 2/16/22.
//

import Foundation

struct Pokemon {
    
    var name: String!
    var id: Int!
    var type: Int!
    var hp: Double!
    var attack: Double!
    var defense: Double!
    var spAttack: Double!
    var spDefense: Double!
    var speed: Double!
    var total: Double!
    var pokemonDesc: String!
    var skillList: [SkillModal]!
    
    init(name: String, id: Int, type: Int, hp: Double, attack: Double, defense: Double, spAttack: Double, spDefense: Double, speed: Double, total: Double, pokemonDesc: String, skillList: [SkillModal] = [SkillModal]()) {
        
        self.name = name
        self.id = id
        self.type = type
        self.hp = hp
        self.attack = attack
        self.defense = defense
        self.spAttack = spAttack
        self.spDefense = spDefense
        self.speed = speed
        self.total = total
        self.pokemonDesc = pokemonDesc
        self.skillList = skillList
      
    }
    
    
}
