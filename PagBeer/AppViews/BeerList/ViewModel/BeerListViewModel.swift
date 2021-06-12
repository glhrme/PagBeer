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

class BeerListViewModel {
    var delegate: BeerListViewModelDelegate?
    
    func goToBeerDetails(model: BeerModel) {
        delegate?.beerDetails(model: model)
    }
    
    func getBeerList() -> [BeerModel] {
        return BeerListService().getBeerList()
    }
}

