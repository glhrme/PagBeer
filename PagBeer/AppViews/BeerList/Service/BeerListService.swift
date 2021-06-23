//
//  BeerListService.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 11/06/21.
//

import Foundation

class BeerListService {
    
    let endpoint = "https://api.punkapi.com/v2/beers"
    
    func fetchBeers(handle: @escaping (_ beers: Result<[BeerModel], Error>) -> Void ) {
        guard let url = URL(string: self.endpoint) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let e = error {
                DispatchQueue.main.async {
                    handle(.failure(e))
                }
            }
            guard let safeData = data else { return }
            DispatchQueue.main.async {
                handle(self.parseJSON(data: safeData))
            }
        }
        task.resume()
    }
    
    func parseJSON(data: Data) -> Result<[BeerModel], Error> {
        let decoder = JSONDecoder()
        do {
            let beersDecoded: [BeerModel] = try decoder.decode([BeerModel].self, from: data)
            return .success(beersDecoded)
        } catch {
            return .failure(error)
        }
    }
}
