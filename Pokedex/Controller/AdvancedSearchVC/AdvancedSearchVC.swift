//
//  AdvancedSearchVC.swift
//  Pokedex
//
//  Created by Ian Shen on 2/14/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import UIKit

class AdvancedSearchVC: UIViewController {
    
    var filterSender: FilterSendingDelegate!
    var filterParameters = AdvancedSearchFilter()
    let allTypesArr : [PokeType] = [PokeType.Water, PokeType.Grass, PokeType.Fire, PokeType.Rock, PokeType.Ice, PokeType.Electric, PokeType.Ground, PokeType.Poison, PokeType.Steel, PokeType.Dark, PokeType.Normal, PokeType.Ghost, PokeType.Dragon, PokeType.Bug, PokeType.Flying,  PokeType.Fighting, PokeType.Fairy, PokeType.Psychic, PokeType.Unknown]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterParameters = AdvancedSearchFilter()
    }
    
    @IBAction func allTypeButtons(sender: UIButton) {
        
        if sender.tag == 0 {
            print("not type button")
            return
        }
        let id = sender.tag
        sender.setBackgroundImage(UIImage(named: "selectedBG"), for: .normal)
        filterParameters.selectedTypes.append(allTypesArr[id - 1])
    }
    
    @IBAction func allStatsTextfield (sender: UITextField) {
        switch sender.tag {
        case 0:
            print("not stats textfield")
            break
        case 1:
            filterParameters.minHp = Int(sender.text!) ?? 0
            break
        case 2:
            filterParameters.maxHp = Int(sender.text!) ?? Int.max
            break
        case 3:
            filterParameters.minAtk = Int(sender.text!) ?? 0
            break
        case 4:
            filterParameters.maxAtk = Int(sender.text!) ?? Int.max
            break
        case 5:
            filterParameters.minDef = Int(sender.text!) ?? 0
            break
        case 6:
            filterParameters.maxDef = Int(sender.text!) ?? Int.max
            break
        case 7:
            filterParameters.minSpeed = Int(sender.text!) ?? 0
            break
        case 8:
            filterParameters.maxSpeed = Int(sender.text!) ?? Int.max
            break
        case 9:
            filterParameters.minSpeAtk = Int(sender.text!) ?? 0
            break
        case 10:
            filterParameters.maxSpeAtk = Int(sender.text!) ?? Int.max
            break
        case 11:
            filterParameters.minSpeDef = Int(sender.text!) ?? 0
            break
        case 12:
            filterParameters.maxSpeDef = Int(sender.text!) ?? Int.max
            break
        case 13:
            filterParameters.minTotal = Int(sender.text!) ?? 0
            break
        case 14:
            filterParameters.maxTotal = Int(sender.text!) ?? Int.max
            break
        default:
            print("in stats textfield default")
        }
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        filterSender.didPressSearch(filter: filterParameters)
        _ = navigationController?.popViewController(animated: true)
    }
    
}

protocol FilterSendingDelegate {
    func didPressSearch (filter: AdvancedSearchFilter)
}
