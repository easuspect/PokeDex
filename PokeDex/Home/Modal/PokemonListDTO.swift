//
//  PokemonListDTO.swift
//  PokeDex
//
//  Created by NewMac on 3/1/22.
//

import Foundation
import ObjectMapper

class PokemonListDTO: Mappable {
    
    public var url: String = ""
    public var name: String = ""
    
    required init?(map: Map) {
        if map.JSON["name"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        name <- map["name"]
    }
}
