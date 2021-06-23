//
//  BeerDetailsViewController.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 12/06/21.
//

import UIKit
import Kingfisher

class BeerDetailsViewController: UIViewController {

    var viewModel: BeerDetailsViewModel?
    
    //MARK: - Outlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageBeer: UIImageView!
    @IBOutlet weak var labelTagline: UILabel!
    @IBOutlet weak var labelInfos: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        bindBeerLayout()
        // Do any additional setup after loading the view.
    }


    //MARK: - Setup
    func setupNavigation() {
        let backItem = UIBarButtonItem()
        backItem.title = "Voltar"
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backItem
    }
    
    //MARK: - Bind
    
    func bindBeerLayout() {
        guard let model = viewModel else { return }
        labelTitle.text = model.beer.name
        labelTagline.text = model.beer.tagline
        labelInfos.text = model.beer.getInfos()
        labelDescription.text = model.beer.description
        
        let url = URL(string: model.beer.image_url ?? "")
        imageBeer.kf.setImage(with: url, placeholder: nil, options:  nil) { (result) in
            switch result {
            case .success:
                self.imageBeer.contentMode = .scaleAspectFit
            case .failure:
                self.imageBeer.contentMode = .center
                self.imageBeer.image = UIImage(systemName: "xmark.icloud")
            }
        }
        
    }

}
