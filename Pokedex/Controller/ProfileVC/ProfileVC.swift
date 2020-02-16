//
//  ViewController.swift
//  Pokedex
//
//  Created by Ian Shen on 2/10/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var idTitle: UILabel!
    @IBOutlet weak var typeTitle: UILabel!
    @IBOutlet weak var attackTitle: UILabel!
    @IBOutlet weak var defenseTitle: UILabel!
    @IBOutlet weak var healthTitle: UILabel!
    @IBOutlet weak var specialAttackTitle: UILabel!
    @IBOutlet weak var specialDefenseTitle: UILabel!
    @IBOutlet weak var speedTitle: UILabel!
    @IBOutlet weak var totalTitle: UILabel!
    @IBOutlet weak var largeImage: UIImageView!
    @IBOutlet weak var gifImage: UIImageView!
    
    var pokemon: Pokemon = PokemonGenerator.getPokemonArray()[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var typesString: String = ""
        for i in 0..<pokemon.types.count {
            if i == pokemon.types.count - 1 {
                typesString = typesString + pokemon.types[i].rawValue
            } else {
                typesString = typesString + pokemon.types[i].rawValue + ", "
            }
        }
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "profileBackground")!)
        nameTitle.text = pokemon.name
        idTitle.text = "#\(pokemon.id)"
        largeImage.image = pokemon.getLargeImage()
        gifImage.image = pokemon.getGifImage()
        typeTitle.text = "Type(s): \(typesString)"
        attackTitle.text = "Attack: \(pokemon.attack)"
        defenseTitle.text = "Defense: \(pokemon.defense)"
        healthTitle.text = "HP: \(pokemon.health)"
        specialAttackTitle.text = "Sp Atk: \(pokemon.specialAttack)"
        specialDefenseTitle.text = "Sp Def: \(pokemon.specialDefense)"
        speedTitle.text = "Speed: \(pokemon.speed)"
        totalTitle.text = "Total: \(pokemon.total)"
    }
    
}

