//
//  BeerListCollectionViewCell.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 22/06/21.
//

import UIKit

class BeerListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - Methods
    //Método que realiza o bind da minha célula
    func setupCell(model: BeerModel) {
        let url = URL(string: model.image_url ?? "")
        imageView.kf.setImage(with: url, placeholder: nil, options:  nil) { (result) in
            switch result {
            case .success:
                self.imageView.contentMode = .scaleAspectFit
            case .failure:
                self.imageView.contentMode = .center
                self.imageView.image = UIImage(systemName: "xmark.icloud")
            }
        }
        labelTitle.text = model.name
    }

}
