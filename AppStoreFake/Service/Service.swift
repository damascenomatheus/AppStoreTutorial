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
    
    func fetchSearch(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> Void) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGames(completion: @escaping (AppsResult?, Error?) -> Void) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"
        
        fetchAppGroups(urlString: urlString, completion: completion)
        
    }
    
    func fetchAppGroups(urlString: String, completion: @escaping (AppsResult?, Error?) -> Void) {
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchHeaderData(completion: @escaping ([HeaderData]?, Error?) -> Void) {
        let url = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGenericJSONData(urlString: url, completion: completion)
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let error = err {
                completion(nil, error)
                print(error)
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result,nil)
            } catch let jsonError {
                completion(nil, jsonError)
                print(jsonError)
            }
            
        }.resume()
    }
}
