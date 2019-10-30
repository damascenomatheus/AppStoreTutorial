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
