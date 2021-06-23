//
//  BeerModel.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 11/06/21.
//

import UIKit

struct BeerModel: Codable {
    let id: Int
    let name: String
    var description: String?
    var image_url: String?
    var abv: Double?
    var ibu: Double?
    var tagline: String?


    func getInfos() -> String {
        let infos = "\(abv?.description ?? "-" )% ABV | \(ibu?.description ?? "-") IBU"
        return infos
    }
}


