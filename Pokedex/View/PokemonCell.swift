//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Ian Shen on 2/12/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import UIKit

class PokemonCell: UICollectionViewCell {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonNumLabel: UILabel!
    @IBOutlet weak var stackHorVer: UIStackView!
    @IBOutlet weak var labelStack: UIStackView!
    @IBOutlet weak var heightRatio2to1Constraint: NSLayoutConstraint!
    @IBOutlet weak var heightRatio1to1Constraint: NSLayoutConstraint!
    
    var gridMode: Bool = true
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if gridMode {
            layer.cornerRadius = frame.width/8
            stackHorVer.axis = .vertical
            heightRatio2to1Constraint.isActive = true
            heightRatio1to1Constraint.isActive = false
        } else {
            layer.cornerRadius = frame.width/16
            stackHorVer.axis = .horizontal
            labelStack.spacing = 0
            //heightRatio1to1Constraint.multiplier = 1
            heightRatio2to1Constraint.isActive = false
            heightRatio1to1Constraint.isActive = true
        }
        
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.black.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
    }
}
