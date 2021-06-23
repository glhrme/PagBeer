//
//  BeerListViewController.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 11/06/21.
//

import UIKit

class BeerListViewController: UIViewController, BeerListDelete {
    let viewModel: BeerListViewModel
    var beerListData: [BeerModel] = []
    let identifierCell = "BeerCell"
    
    //MARK: - IBOutlets
    @IBOutlet weak var stackViewMain: UIStackView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewController = self
        // Atavés do meu viewModel, pego a lista de cervejas (ainda mockada)
        viewModel.getBeerList()
        
        // Registrando minha célula na tabela para depois recuperar no método que retorna a célula reutilizavel
        collectionView.register(UINib(nibName: "BeerListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: self.identifierCell)
        // Avisando a minha tabela que o responsável por implementar seu DataSource delegate é este ViewController
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    init(_ viewModel: BeerListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "BeerListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        viewModel = BeerListViewModel()
        super.init(coder: coder)
    }
    
    func updateData(data: [BeerModel]) {
        self.beerListData = data
        collectionView.reloadData()
    }
}

//MARK: - UITableView
extension BeerListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.beerListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifierCell, for: indexPath) as! BeerListCollectionViewCell
        cell.setupCell(model: self.beerListData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2
        return CGSize(width: width - 5, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel.goToBeerDetails(model: self.beerListData[indexPath.row])
    }
    
}
