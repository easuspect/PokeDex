//
//  DetailViewController.swift
//  PokeDex
//
//  Created by NewMac on 2/21/22.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    // MARK : Outlets
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var infoBackgroundView: UIView!
    
    // MARK : Properties
    
    var selectedPokemon: PokemonDTO!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.prepareUI()
       
    }
    
    func prepareUI() {
        self.view.backgroundColor = Colors.colorList[selectedPokemon.type]
        self.innerView.layer.cornerRadius = 24
        self.typeImageView.addShadow(radius: 8, shadowColor: UIColor.black)
        self.infoBackgroundView.addShadow(radius: 12, shadowColor: UIColor.black)
        self.typeImageView.image = UIImage(named: String(selectedPokemon.type))
        self.idLabel.text = "#\(self.calculateDigits(id: String(selectedPokemon.id)))"
        let url = URL(string: selectedPokemon.sprites.other.officialArtwork.frontDefault)
        self.pokemonImageView.kf.setImage(with: url)
        //self.descLabel.text = selectedPokemon.pokemonDesc
        self.nameLabel.text = selectedPokemon.name
        self.heightLabel.text = "\(selectedPokemon.height) cm"
        self.weightLabel.text = "\(selectedPokemon.weight) kg"
        self.typeLabel.text = pokemonTypeList[selectedPokemon.type]
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

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedPokemon.skillList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let skillCell = tableView.dequeueReusableCell(withIdentifier: "SkillCell") as! SkillTableViewCell
        let selectedSkill = selectedPokemon.skillList[indexPath.row]
        skillCell.prepareCell(skill: selectedSkill)
        return skillCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
