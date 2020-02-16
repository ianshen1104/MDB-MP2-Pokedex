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
    var advancedSearchFilter: AdvancedSearchFilter = AdvancedSearchFilter()
    var advancedSearchActivated: Bool = false
    var randomRequested: Bool = false
    var segueNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search By Name"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        //let adcancedSearchVC = storyboard?.instantiateViewController(withIdentifier: "AdvancedSearchVC") as! AdvancedSearchVC
        //advancedSearchVC.filterSender = self

        self.collectionView.backgroundColor = UIColor.clear
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueNum {
        case 0:
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
            break
        case 1:
            guard let destinationVC = segue.destination as? AdvancedSearchVC else {
                return
            }
            destinationVC.filterSender = self
            break
        default:
            print("segue error from SearchVC")
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
        segueNum = 1
        self.performSegue(withIdentifier: "ToAdvancedSearch", sender: self)
        print("pressed")
    }
    
    @IBAction func randomPressed(_ sender: Any) {
        randomRequested = true
        randomGenerateFilteredPokemons()
    }
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return (searchController.isActive && !isSearchBarEmpty) || advancedSearchActivated || randomRequested
    }

    func filterContentForSearchText(_ searchText: String) {
        filteredPokemons = pokemons.filter { (pokemon: Pokemon) -> Bool in
        return pokemon.name.lowercased().contains(searchText.lowercased())
      }
        advancedSearchActivated = false
        randomRequested = false
        collectionView.reloadData()
    }
    
    func filterContentForAdvancedSearch(_ filterParameters: AdvancedSearchFilter) {
        filteredPokemons = pokemons.filter { (pokemon: Pokemon) -> Bool in
            return filterParameters.filterPokemon(pokemon)
        }
        collectionView.reloadData()
    }
    
    func randomGenerateFilteredPokemons() {
        filteredPokemons = []
        for _ in 0..<20 {
            let id = Int.random(in: 0 ... pokemons.count)
            filteredPokemons.append(pokemons[id])
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

extension SearchVC: FilterSendingDelegate {
    func didPressSearch(filter: AdvancedSearchFilter) {
        advancedSearchFilter = filter
        filterContentForAdvancedSearch(filter)
        advancedSearchActivated = true
    }
}
