//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Pedro Grando on 18/11/22.
//

import UIKit

class PokemonCell: UITableViewCell {

    @IBOutlet weak var backgroundCell: UIView!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var typePokemonOne: UILabel!
    @IBOutlet weak var typePokemonTwo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundCell.layer.cornerRadius = 10
    }
    
    func configCell(pokemon: Pokemon) {
        pokemonImage.image = UIImage(named: String(format: "%03d", pokemon.id))
        pokemonName.text = pokemon.name.english
        
        if pokemon.type.count == 1 {
            
            typePokemonOne.text = pokemon.type[0]
            typePokemonOne.backgroundColor = UIColor(named: pokemon.type[0].lowercased())
            typePokemonTwo.isHidden = true
            
            setStyleLabel(label: typePokemonOne)
    
        } else if pokemon.type.count > 1 {
            
            typePokemonOne.text = pokemon.type[0]
            typePokemonTwo.text = pokemon.type[1]
            typePokemonOne.backgroundColor = UIColor(named: pokemon.type[0].lowercased())
            typePokemonTwo.backgroundColor = UIColor(named: pokemon.type[1].lowercased())
            typePokemonTwo.isHidden = false
            
            setStyleLabel(label: typePokemonOne)
            setStyleLabel(label: typePokemonTwo)
        }
    }
    
    func setStyleLabel(label: UILabel) {
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.textColor = .white
    }
    
}
