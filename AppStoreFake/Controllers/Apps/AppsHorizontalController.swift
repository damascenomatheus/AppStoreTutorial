//
//  AppsHorizontalController.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 30/10/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

class AppsHorizontalController: BaseCollectionController {
    
    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
    
    fileprivate func setupCollection() {
        collectionView.backgroundColor = .blue
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        if let lay = collectionViewLayout as? UICollectionViewFlowLayout {
            lay.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

extension AppsHorizontalController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height)
    }
}
