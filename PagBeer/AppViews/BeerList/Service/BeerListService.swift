//
//  BeerListService.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 11/06/21.
//

import Foundation

class BeerListService {
    let beerList: [BeerModel]
    
    init() {
        self.beerList = [
            BeerModel(id: 1, name: "Buzz", description: "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.", image_url: "keg.png", abv: 4.5, ibu: 60, tagline: "A Real Bitter Experience."),
            BeerModel(id: 2, name: "Trashy Blonde", description: "A titillating, neurotic, peroxide punk of a Pale Ale. Combining attitude, style, substance, and a little bit of low self esteem for good measure; what would your mother say? The seductive lure of the sassy passion fruit hop proves too much to resist. All that is even before we get onto the fact that there are no additives, preservatives, pasteurization or strings attached. All wrapped up with the customary BrewDog bite and imaginative twist.", image_url: "2.png", abv: 4.1, ibu: 41.5, tagline: "You Know You Shouldn't"),
            BeerModel(id: 2, name: "Berliner Weisse With Yuzu - B-Sides", description: "Japanese citrus fruit intensifies the sour nature of this German classic.", image_url: "keg.png", abv: 4.2, ibu: 8, tagline: "Japanese Citrus Berliner Weisse.")
        ]
    }
    
    func getBeerList() -> [BeerModel] {
        return self.beerList
    }
}
