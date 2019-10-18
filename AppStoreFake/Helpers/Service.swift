//
//  Service.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 13/10/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    
    func fetchApi(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let error = err {
                print("Failed to fetch apps: ", error)
                completion([],error)
                return
            }
                
            guard let data = data else { return }
                
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
                
                
            } catch let jsonError {
                print("Failed to load json: ", jsonError)
                completion([],jsonError)
            }
            
        }.resume()
    }
}
