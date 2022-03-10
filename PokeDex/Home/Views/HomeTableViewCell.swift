//
//  HomeTableViewCell.swift
//  PokeDex
//
//  Created by NewMac on 2/16/22.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {

    //MARK : Outlets
    
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func prepareCell(pokemon: PokemonDTO) {
        self.innerView.addShadow(radius: 8, shadowColor: Colors.colorList[pokemon.type])
        self.innerView.backgroundColor = Colors.colorList[pokemon.type]
        self.typeImageView.addShadow(radius: 8, shadowColor: UIColor.black)
        
        self.numberLabel.text = "#\(self.calculateDigits(id: String(pokemon.id)))"
        self.pokemonImageView.image = UIImage(named: calculateDigits(id: String(pokemon.id)))
        self.titleLabel.text = pokemon.name
        let url = URL(string: pokemon.sprites.other.officialArtwork.frontDefault)
        self.pokemonImageView.kf.setImage(with: url)
        self.typeImageView.image = UIImage(named: String(pokemon.type))
    }
    
    func calculateDigits(id: String) -> String {
        if id.count == 1 {
            return "00\(id)"
        } else if id.count == 2 {
            return "0\(id)"
        }
        return id
    }
}


