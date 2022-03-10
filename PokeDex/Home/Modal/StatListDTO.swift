//
//  StatListDTO.swift
//  PokeDex
//
//  Created by NewMac on 3/9/22.
//

import Foundation
import ObjectMapper

class StatListDTO: Mappable {
    
    public var baseStat: Int = 0
    public var effort: Int = 0
    public var stat: StatDTO!
    
    required init?(map: Map) {
        if map.JSON["base_stat"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
        baseStat <- map["base_stat"]
        effort <- map["effort"]
        stat <- map["stat"]
    }
}
