//
//  SearchVC-TableView.swift
//  Pokedex
//
//  Created by Ian Shen on 2/12/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import UIKit

extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
            return filteredPokemons.count
        }
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        let pokemon: Pokemon
        if isFiltering {
            pokemon = filteredPokemons[indexPath.row]
        } else {
            pokemon = pokemons[indexPath.row]
        }
        cell.pokemonNameLabel.text = pokemon.name
        cell.pokemonNumLabel.text = String(pokemon.id)
        cell.pokemonImage.image = pokemon.getLargeImage()
        if gridMode {
            cell.gridMode = true
        } else {
            cell.gridMode = false
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        idPressed = indexPath.row
        segueNum = 0
        self.performSegue(withIdentifier: "ShowProfileSegue", sender: self)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var returnSize: CGSize
        if gridMode {
            returnSize = CGSize(width: collectionView.frame.width/2.075, height: collectionView.frame.width/1.5)
        } else {
            returnSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.width/2.8)
        }
        return returnSize

    }

}
