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
        
        tableView.dataSource = self
        tableView.delegate = self
    
        parseJson()
    }
    
    func parseJson() {
        let jsonPath = Bundle.main.url(forResource: "pokedex", withExtension: "json")
        if let path = jsonPath {
            let jsonData = try? Data(contentsOf: path)
            if let data = jsonData {
                let decoder = JSONDecoder()
                pokemon = try! decoder.decode([Pokemon].self, from: data)

            }
            
        }
        
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonCell
        
        cell.configCell(pokemon: pokemon[indexPath.row])
        
        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
}
