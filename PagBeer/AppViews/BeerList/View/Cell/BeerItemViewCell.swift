//
//  BeerItemViewCell.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 11/06/21.
//

import UIKit
import Kingfisher

class BeerItemViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var imageBeer: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelInfos: UILabel!
    
    
    //MARK: - Methods
    //Método que realiza o bind da minha célula
    func setupCell(model: BeerModel) {
        let url = URL(string: model.getImage())
        imageBeer.kf.setImage(with: url, placeholder: nil, options:  nil) { (result) in
            switch result {
            case .success:
                self.imageBeer.contentMode = .scaleAspectFit
            case .failure:
                self.imageBeer.contentMode = .center
                self.imageBeer.image = UIImage(systemName: "xmark.icloud")
            }
        }
        labelTitle.text = model.name
        labelInfos.text = "\(model.getAbv())% Abv | \(model.getIbu()) Ibu"
    }
    
}
