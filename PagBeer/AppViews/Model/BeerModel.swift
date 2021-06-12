//
//  BeerModel.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 11/06/21.
//

import UIKit

class BeerModel: NSObject {
    let id: Int
    let name: String
    let descricao: String
    let image_url: String
    let abv: Double
    let ibu: Double
    let tagline: String
    
    init(id: Int, name: String, description: String, image_url: String, abv: Double, ibu: Double, tagline: String) {
        self.id = id
        self.name = name
        self.descricao = description
        self.image_url = image_url
        self.abv = abv
        self.ibu = ibu
        self.tagline = tagline
    }
}
