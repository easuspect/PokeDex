//
//  Sprites.swift
//  PokeDex
//
//  Created by NewMac on 3/5/22.
//

import Foundation
import ObjectMapper

class Sprites: Mappable {
    

    public var other: OtherDTO!
    
    required init?(map: Map) {
        if map.JSON["other"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
       
        other <- map["other"]
    }
}

class OtherDTO: Mappable {
    

    public var officialArtwork: OfficialArtwork!
    
    required init?(map: Map) {
        if map.JSON["official-artwork"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
       
        officialArtwork <- map["official-artwork"]
    }
}

class OfficialArtwork: Mappable {
    
    public var frontDefault: String = ""
    
    required init?(map: Map) {
        if map.JSON["front_default"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
       
        frontDefault <- map["front_default"]
    }
}
