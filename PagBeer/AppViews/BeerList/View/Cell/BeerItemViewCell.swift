//
//  BeerItemViewCell.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 11/06/21.
//

import UIKit

class BeerItemViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var imageBeer: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelInfos: UILabel!
    
    //MARK: - Methods
    //Método que realiza o bind da minha célula
    func setupCell(model: BeerModel) {
        imageBeer.image = UIImage(named: model.image_url)
        labelTitle.text = model.name
        labelInfos.text = "\(model.abv)% Abv | \(model.ibu) Ibu"
    }
    
}
