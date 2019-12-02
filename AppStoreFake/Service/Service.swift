//
//  Service.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 13/10/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

class Service {
    
    static let shared = Service()
    
    
    func fetchSearch(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
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
    
    func fetchGames(completion: @escaping (AppsResult?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let error = err {
                completion(nil, error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let results = try JSONDecoder().decode(AppsResult.self, from: data)
                completion(results, nil)
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                completion(nil, jsonError)
            }
            
            
        }.resume()
        
    }
}
