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
    
    @IBOutlet weak var typePicker : UIPickerView!
    var allTypesArr : [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allTypesArr = ["Bug", "Grass", "Dark", "Ground", "Dragon", "Ice", "Electric", "Normal", "Fairy", "Poison", "Fighting", "Psychic", "Fire", "Rock", "Flying", "Steel", "Ghost", "Water", "Unknown"]
    }
}
