//
//  TypeListDTO.swift
//  PokeDex
//
//  Created by NewMac on 3/5/22.
//

import Foundation
import ObjectMapper

class TypeListDTO: Mappable {
    
    public var name: String = ""
    public var url: String = ""
    
    required init?(map: Map) {
        if map.JSON["name"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        url <- map["url"]
    }
}

class TypeModel: Mappable {
    
    public var slot: Int = 0
    public var type: TypeListDTO!
    
    required init?(map: Map) {
        if map.JSON["slot"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
        slot <- map["slot"]
        type <- map["type"]
    }
}
