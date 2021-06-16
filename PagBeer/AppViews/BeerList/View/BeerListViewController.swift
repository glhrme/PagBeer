//
//  BeerListViewController.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 11/06/21.
//

import UIKit

class BeerListViewController: UIViewController, UIBeerList {
    let viewModel: BeerListViewModel
    var beerListData: [BeerModel] = []
    let identifierCell = "BeerCell"
    
    //MARK: - IBOutlets
    @IBOutlet weak var stackViewMain: UIStackView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var tableViewBeers: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewController = self
        // Atavés do meu viewModel, pego a lista de cervejas (ainda mockada)
        viewModel.getBeerList()
        
        // Registrando minha célula na tabela para depois recuperar no método que retorna a célula reutilizavel
        tableViewBeers.register(UINib(nibName: "BeerItemViewCell", bundle: nil), forCellReuseIdentifier: self.identifierCell)
        // Avisando a minha tabela que o responsável por implementar seu DataSource delegate é este ViewController
        tableViewBeers.dataSource = self
        tableViewBeers.delegate = self
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
        //UPDATE Date
        self.beerListData = data
        tableViewBeers.reloadData()
    }
}

//MARK: - UITableView
extension BeerListViewController: UITableViewDataSource, UITableViewDelegate {
    //Configurando a quantidade de itens da minha tabela
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerListData.count
    }
    
    //Configurando célula que irá aparecer na minha table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifierCell) as! BeerItemViewCell
        let beerList = self.beerListData
        cell.accessibilityIdentifier = "BeerCell\(indexPath.row)"
        cell.setupCell(model: beerList[indexPath.row])
        cell.layer.borderWidth = 5
        cell.layer.borderColor = #colorLiteral(red: 0.6739478344, green: 1, blue: 0.9955382427, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.goToBeerDetails(model: self.beerListData[indexPath.row])
    }
}
