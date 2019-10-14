//
//  Service.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 13/10/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import Foundation

class Service {
    
    func fetchItunesApps() {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let error = err {
                print("Failed to fetch apps: ", error)
                return
            }
                
            guard let data = data else { return }
                
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                searchResult.results.forEach({
                    print($0.trackName, $0.primaryGenreName)
                })
            } catch let jsonError {
                print("Failed to load json: ", jsonError)
            }
            
        }.resume()
    }

}
