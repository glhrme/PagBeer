//
//  BeerListViewController.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 11/06/21.
//

import UIKit

class BeerListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let viewModel: BeerListViewModel
    var beerListData: [BeerModel]? = nil
    let identifierCell = "BeerCell"
    
    //MARK: - IBOutlets
    @IBOutlet weak var stackViewMain: UIStackView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var tableViewBeers: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Atavés do meu viewModel, pego a lista de cervejas (ainda mockada)
        self.beerListData = viewModel.getBeerList()
        
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
    
    //MARK: - UITableViewDataSource
    //Configurando a quantidade de itens da minha tabela
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = beerListData?.count else { return 0 }
        return count
    }
    
    //Configurando célula que irá aparecer na minha table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifierCell) as! BeerItemViewCell
        guard let beerList = self.beerListData else { return cell }
        cell.accessibilityIdentifier = "BeerCell\(indexPath.row)"
        cell.setupCell(model: beerList[indexPath.row])
        cell.layer.borderWidth = 5
        cell.layer.borderColor = #colorLiteral(red: 0.6739478344, green: 1, blue: 0.9955382427, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let beerList = self.beerListData else { return }
    
        viewModel.goToBeerDetails(model: beerList[indexPath.row])
    }
    
}
