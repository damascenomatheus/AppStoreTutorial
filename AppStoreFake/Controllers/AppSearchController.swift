//
//  AppSearchController.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 23/09/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class AppSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchCollectionCell.self, forCellWithReuseIdentifier: "Test")
        setupSearchBar()
        fetchItunesApps()
    }
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
    }
    
    fileprivate var appResult = [Result]()
    
    fileprivate func fetchItunesApps() {
        let urlItunes = "https://itunes.apple.com/search?term=instagram&entity=software"
        Service.shared.fetchApi(url: urlItunes) { (results, error) in
            //fail case
            if let err = error {
                print("Failed to fetch apps:", err)
                return
            }
            //success case
            self.appResult = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResult.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Test", for: indexPath) as! SearchCollectionCell
        cell.appResult = appResult[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height/2.3)
    }
    
}
