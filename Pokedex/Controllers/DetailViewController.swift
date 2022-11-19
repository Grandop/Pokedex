//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Pedro Grando on 19/11/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var typePokemon: UILabel!
    @IBOutlet weak var typePokemonTwo: UILabel!
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    @IBOutlet weak var healthIcon: UIImageView!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var healthValue: UILabel!
    
    @IBOutlet weak var attackIcon: UIImageView!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var attackValue: UILabel!
    
    @IBOutlet weak var defenseIcon: UIImageView!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var defenseValue: UILabel!
    
    @IBOutlet weak var speedIcon: UIImageView!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var speedValue: UILabel!
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstView.backgroundColor = UIColor(named: (pokemon?.type[0].lowercased())!)
        pokemonName.text = pokemon?.name.english
        pokemonImage.image = UIImage(named: String(format: "%03d", pokemon!.id))
        
        setupLayout()
        
        if pokemon?.type.count == 1 {
            typePokemonTwo.isHidden = true
            typePokemon.text = pokemon?.type[0]
            typePokemon.backgroundColor = UIColor(named: (pokemon?.type[0].lowercased())!)
            
            setStyleLabel(label: typePokemon)

        } else if pokemon!.type.count > 1 {
            typePokemon.text = pokemon?.type[0]
            typePokemonTwo.text = pokemon?.type[1]
            
            typePokemon.backgroundColor = UIColor(named: (pokemon?.type[0].lowercased())!)
            typePokemonTwo.backgroundColor = UIColor(named: (pokemon?.type[1].lowercased())!)
            
            setStyleLabel(label: typePokemon)
            setStyleLabel(label: typePokemonTwo)
        }
    
    }
    
    func setStyleLabel(label: UILabel) {
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.textColor = .white
    }
    
    func setupLayout() {
        let hpValue = pokemon!.base.hp
        let atckValue = pokemon!.base.attack
        let defValue = pokemon!.base.defense
        let speedLetValue = pokemon!.base.speed
        
        healthIcon.image = UIImage(named: "health")
        healthLabel.text = "Health"
        healthValue.text = String(hpValue)
        
        attackIcon.image = UIImage(named: "attack")
        attackLabel.text = "Attack"
        attackValue.text = String(atckValue)
        
        defenseIcon.image = UIImage(named: "defense")
        defenseLabel.text = "Defense"
        defenseValue.text = String(defValue)
        
        speedIcon.image = UIImage(named: "speed")
        speedLabel.text = "Speed"
        speedValue.text = String(speedLetValue)
    }
    
    
}
