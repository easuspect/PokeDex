//
//  HomeViewController.swift
//  PokeDex
//
//  Created by NewMac on 2/16/22.
//

import UIKit

class HomeViewController: UIViewController {

    
    // MARK : Outlets
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK : Properties
    
    var selectedPokemonList = [PokemonDTO]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        self.selectedPokemonList = PokemonList
        
    }
    
   
    
    @IBAction func nameEntered(_ sender: Any) {
        let searchText = self.searchTextField.text ?? ""
        if searchText.isEmpty {
            self.searchTextField.endEditing(true)
            self.selectedPokemonList = PokemonList
        } else {
            self.selectedPokemonList = PokemonList.filter { (pokemon: PokemonDTO) -> Bool in
                return pokemon.name.lowercased().contains(searchText.lowercased())
            }
        }
        self.tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let detailVC = segue.destination as? DetailViewController {
                if let pokemon = sender as? PokemonDTO {
                    detailVC.selectedPokemon = pokemon
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedPokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeTableViewCell
        let selectedCell = selectedPokemonList[indexPath.row]
        homeCell.prepareCell(pokemon: selectedCell)
        return homeCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPokemon = self.selectedPokemonList[indexPath.row]
        self.performSegue(withIdentifier: "ShowDetail", sender: selectedPokemon)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
}
