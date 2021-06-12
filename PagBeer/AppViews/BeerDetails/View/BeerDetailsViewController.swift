//
//  BeerDetailsViewController.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 12/06/21.
//

import UIKit

class BeerDetailsViewController: UIViewController {

    var viewModel: BeerDetailsViewModel?
    
    //MARK: - Outlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageBeer: UIImageView!
    
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
        guard let beer = viewModel?.beer else { return }
        labelTitle.text = beer.name
        imageBeer.image = UIImage(named: beer.image_url)
    }

}
