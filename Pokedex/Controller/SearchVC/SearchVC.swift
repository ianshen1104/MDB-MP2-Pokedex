//
//  ViewController.swift
//  Pokedex
//
//  Created by Ian Shen on 2/10/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    var pokemons: [Pokemon] = PokemonGenerator.getPokemonArray()
    var filteredPokemons: [Pokemon] = []
    var idPressed: Int = 0
    var gridMode: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search By Name"
        navigationItem.searchController = searchController
        definesPresentationContext = true

        self.collectionView.backgroundColor = UIColor.clear
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard
            segue.identifier == "ShowProfileSegue",
            let indexPath = collectionView.indexPathsForSelectedItems,
            let destinationVC = segue.destination as? ProfileVC
            else {
                return
        }
        
        
        let pokemon: Pokemon
        if isFiltering {
            pokemon = filteredPokemons[idPressed]
        } else {
            pokemon = pokemons[idPressed]
        }
        if let destinationVC = segue.destination as? ProfileVC {
            destinationVC.pokemon = pokemon
        }

    }
    
    @IBAction func collectionViewLayoutSwitch(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            gridMode = true
            collectionView.reloadData()
            break
        case 1:
            gridMode = false
            collectionView.reloadData()
            break
        default:
            print("Segmented Control Error")
        }
    }
    
    @IBAction func advancedSearchPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "ToAdvancedSearch", sender: self)
    }
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }

    func filterContentForSearchText(_ searchText: String) {
        filteredPokemons = pokemons.filter { (pokemon: Pokemon) -> Bool in
        return pokemon.name.lowercased().contains(searchText.lowercased())
      }
      collectionView.reloadData()
    }
}

extension SearchVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}
