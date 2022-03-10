//
//  PokemonListResponse.swift
//  PokeDex
//
//  Created by NewMac on 3/1/22.
//

import Foundation
import ObjectMapper

class PokemonListResponse: Mappable {
    
    public var count: Int = 0
    public var next: String = ""
    public var previous: String = ""
    public var results: [PokemonListDTO] = [PokemonListDTO]()
    
    required init?(map: Map) {
        if map.JSON["count"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
        count <- map["count"]
        next <- map["next"]
        previous <- map["previous"]
        results <- map["results"]

    }
}

