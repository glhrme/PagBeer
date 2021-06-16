//
//  BeerListService.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 11/06/21.
//

import Foundation

class BeerListService {
    
    let endpoint = "https://api.punkapi.com/v2/beers"
    
    func fetchBeers(handle: @escaping (_ beers: [BeerModel]) -> Void ) {
        guard let url = URL(string: self.endpoint) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                //TODO - Tratar erro de alguma forma
                
            }
            
            guard let safeData = data else { return }
            DispatchQueue.main.sync {
                handle(self.parseJSON(data: safeData))
            }
        }
        
        task.resume()
    }
    
    func parseJSON(data: Data) -> [BeerModel] {
        let decoder = JSONDecoder()
        
        do {
            let BeersDecoded: [BeerModel] = try decoder.decode([BeerModel].self, from: data)
            return BeersDecoded
        } catch {
            return []
        }
        
    }
}
