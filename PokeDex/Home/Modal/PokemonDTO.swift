//
//  PokemonDTO.swift
//  PokeDex
//
//  Created by NewMac on 3/1/22.
//

import Foundation
import ObjectMapper

class PokemonDTO: Mappable {
    
    public var weight: Double = 0
    public var name: String = ""
    public var height: Double = 0
    public var id: Int = 0
    public var order: Int = 0
    public var sprites: Sprites!
    public var types: [TypeModel]!
    public var stats: [StatListDTO]!
    
    public var type: Int = 0
    public var skillList = [SkillModal]()
    
    required init?(map: Map) {
        if map.JSON["name"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
        weight <- map["weight"]
        height <- map["height"]
        name <- map["name"]
        id <- map["id"]
        order <- map["order"]
        sprites <- map["sprites"]
        types <- map["types"]
        stats <- map["stats"]
    }
}
