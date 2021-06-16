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
    let description: String?
    let image_url: String?
    let abv: Double?
    let ibu: Double?
    let tagline: String?
    
    func getDescription() -> String {
        if self.description != nil {
            return self.description!
        } else {
            return ""
        }
    }
    
    func getAbv() -> String {
        if self.abv != nil {
            return "\(self.abv!)"
        } else {
            return "-"
        }
    }
    
    func getIbu() -> String {
        if self.ibu != nil {
            return "\(self.ibu!)"
        } else {
            return "-"
        }
    }
    
    func getTagline() -> String {
        if self.tagline != nil {
            return "\(self.tagline!)"
        } else {
            return "-"
        }
    }
    
    func getInfos() -> String {
        let infos = "\(self.getAbv())% ABV | \(self.getIbu()) IBU"
        return infos
    }
    
    func getImage() -> String {
        if self.image_url != nil {
            return self.image_url!
        } else {
            return ""
        }
    }
}
