//
//  SplashViewController.swift
//  PokeDex
//
//  Created by NewMac on 3/1/22.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class SplashViewController: UIViewController {

    // MARK : Properties
    
    var pokemonUrlList = [PokemonListDTO]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getPokemonList()
    }
    
    
    func getPokemonList() {
        Alamofire.request("https://pokeapi.co/api/v2/pokemon?limit=151", method: .get, parameters: nil, encoding: URLEncoding(destination: .queryString), headers: nil).responseObject {
            (response: DataResponse<PokemonListResponse>) in

            if let pokemonListResponse = response.result.value {
                self.pokemonUrlList = pokemonListResponse.results
                self.getPokemonDetails()
            }
        }
    
    }

    func getPokemonDetails() {
        for pokemon in self.pokemonUrlList {
            Alamofire.request(pokemon.url, method: .get, parameters: nil, encoding: URLEncoding(destination: .queryString), headers: nil).responseObject{
                (response: DataResponse<PokemonDTO>) in
              
                if let pokemonResponse = response.result.value {
                    let indexOfType = pokemonTypeList.firstIndex(of: pokemonResponse.types[0].type.name) ?? 0
                    pokemonResponse.type = indexOfType
                    var skillList = [SkillModal]()
                    for skill in pokemonResponse.stats {
                        let newSkill = SkillModal(name: skill.stat.name, level: Double(skill.baseStat), type: pokemonResponse.type)
                        skillList.append(newSkill)
                    }
                    pokemonResponse.skillList = skillList
                    PokemonList.append(pokemonResponse)
                }
                if PokemonList.count == 151 {
                    PokemonList = PokemonList.sorted(by: { $0.id < $1.id})
                    self.performSegue(withIdentifier: "ShowHome", sender: self)
                }
            }
        }
    }
}
