//
//  BeerListViewModel.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 11/06/21.
//

import Foundation

protocol BeerListViewModelDelegate {
    func beerDetails(model: BeerModel)
}

protocol UIBeerList {
    func updateData(data: [BeerModel])
}

class BeerListViewModel {
    var delegate: BeerListViewModelDelegate?
    var viewController: UIBeerList?
    
    func goToBeerDetails(model: BeerModel) {
        delegate?.beerDetails(model: model)
    }
    
    func getBeerList() {
        BeerListService().fetchBeers { (beers) in
            self.viewController?.updateData(data: beers)
        }
    }
}

