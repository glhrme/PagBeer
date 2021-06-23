//
//  BeerCoordinator.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 11/06/21.
//

import UIKit

class BeerCoordinator {
    // Responsável pela navegação dentro do app através do coordinator
    var navigation: UINavigationController?
    
    var beerListView: BeerListViewController?
    var beerListViewModel: BeerListViewModel?
    
    func start() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: getBeerList())
        self.navigation = navigation
        return navigation
    }
    
    func getBeerList() -> BeerListViewController {
        let viewModel = BeerListViewModel()
        viewModel.delegate = self
        let beerListView = BeerListViewController(viewModel)
        self.beerListView = beerListView
        self.beerListViewModel = viewModel
        return beerListView
    }
    
}

// Delegate em extension

extension BeerCoordinator: BeerListViewModelDelegate {
    func beerDetails(model: BeerModel) {
        let controller = BeerDetailsViewController()
        controller.viewModel = BeerDetailsViewModel(beer: model)
        self.navigation?.pushViewController(controller, animated: true)
    }
}


