//
//  SkillModal.swift
//  PokeDex
//
//  Created by NewMac on 2/24/22.
//

import Foundation

class SkillModal {
    var name: String!
    var level: Double!
    var type: Int!
    
    init(name: String, level: Double, type: Int) {
        
        self.name = name
        self.level = level
        self.type = type
    }
}
