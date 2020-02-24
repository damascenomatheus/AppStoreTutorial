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
        
        fetchAppGroups(urlString: urlString, completion: completion)
        
    }
    
    func fetchAppGroups(urlString: String, completion: @escaping (AppsResult?, Error?) -> Void) {
        let url = URL(string: urlString)
        
        guard let urlString = url else { return }
        
        URLSession.shared.dataTask(with: urlString) { (data, resp, err) in
            if let error = err {
                completion(nil,error)
                print(error)
            }
            
            guard let data = data else { return }
            
            do {
                let results = try JSONDecoder().decode(AppsResult.self, from: data)
                completion(results,nil)
            } catch let jsonError {
                completion(nil,jsonError)
                print(jsonError)
            }
            
        }.resume()
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
