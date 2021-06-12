//
//  BeerDetailsViewModel.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 12/06/21.
//

import Foundation

class BeerDetailsViewModel {
    let beer: BeerModel
    
    init(beer: BeerModel) {
        self.beer = beer
    }
    
    func getInfos() -> String {
        let infos = "\(beer.abv)% ABV | \(beer.ibu) IBU"
        return infos
    }
    
    func getImage() -> String {
        return beer.image_url
    }
}
