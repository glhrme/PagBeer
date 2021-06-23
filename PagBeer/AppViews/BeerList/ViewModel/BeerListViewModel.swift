//
//  BeerListViewModel.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 11/06/21.
//

import Foundation

protocol BeerListViewModelDelegate: AnyObject {
    func beerDetails(model: BeerModel)
}

protocol BeerListDelete: AnyObject {
    /// Função responsável pela atualização da tabela.
    func updateData(data: [BeerModel])
}

class BeerListViewModel {
    weak var delegate: BeerListViewModelDelegate?
    weak var viewController: BeerListDelete?
    
    func goToBeerDetails(model: BeerModel) {
        delegate?.beerDetails(model: model)
    }
    
    func getBeerList() {
        BeerListService().fetchBeers { (result) in
            switch result {
            case .success(let beers):
                self.viewController?.updateData(data: beers)
            case .failure(let error):
                print(error)
            }
        }
    }
}

