//
//  ViewController.swift
//  Pokedex
//
//  Created by Julia Eileen Schäfer on 18/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var pokemon: [Pokemon] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pokedex"
        self.navigationController?.navigationBar.tintColor = .white
        
        pokemon = parseJson()
        
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemonCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonCell
        
        pokemonCell.configCell(pokemon: pokemon[indexPath.row])
        
        return pokemonCell
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailScreen: UIStoryboard = UIStoryboard(name: "DetailScreen", bundle: nil)
        
        let detailVC = detailScreen.instantiateViewController(withIdentifier: "pokemonDetail") as! DetailViewController
        
        detailVC.pokemon = pokemon[indexPath.row]
        
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
