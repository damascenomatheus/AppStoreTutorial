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

class SearchController: BaseCollectionController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchCollectionCell.self, forCellWithReuseIdentifier: "Test")
        
        setupSearchBar()
    }
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        collectionView.addSubview(enterSearchTermLabel)
        NSLayoutConstraint.activate([
            enterSearchTermLabel.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 100),
            enterSearchTermLabel.leftAnchor.constraint(equalTo: collectionView.leftAnchor, constant: 50),
            enterSearchTermLabel.rightAnchor.constraint(equalTo: collectionView.rightAnchor, constant: 50),
            enterSearchTermLabel.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0),
            
        ])
    }
    
    fileprivate let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter the search term above..."
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var timer: Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (_) in
            Service.shared.fetchSearch(searchTerm: searchText) { (res, err) in
                if let error = err {
                    print("Failed to search the app:", error)
                    return
                }
                self.appResult = res?.results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    fileprivate var appResult = [Result]()
    
    fileprivate func fetchItunesApps() {
        
        Service.shared.fetchSearch(searchTerm: "Instagram") { (res, error) in
            //fail case
            if let err = error {
                print("Failed to fetch apps:", err)
                return
            }
            //success case
            self.appResult = res?.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = appResult.count != 0
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
