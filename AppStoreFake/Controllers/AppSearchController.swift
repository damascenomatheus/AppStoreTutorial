//
//  AppSearchController.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 23/09/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import Foundation
import UIKit

class AppSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
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
        
        fetchItunesApps()
    }
    
    fileprivate var appResult = [Result]()
    
    func fetchItunesApps() {
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
        cell.appTitle.text = appResult[indexPath.item].trackName
        cell.categoryLabel.text = appResult[indexPath.item].primaryGenreName
        cell.ratingsLabel.text = "\((appResult[indexPath.item].averageUserRating) ?? 0) ★"
        let imageName = appResult[indexPath.item].artworkUrl100
        cell.appImage.image = UIImage(named: imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height/2.3)
    }
    
}
