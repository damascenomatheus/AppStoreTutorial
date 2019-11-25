//
//  AppsHeaderHorizontalController.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 22/11/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

class AppsHeaderHorizontalController: BaseCollectionController {
    
    fileprivate let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        setupLayoutDirection()
    }
    
    fileprivate func setupLayoutDirection() {
        if let lay = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            lay.scrollDirection = .horizontal
        }
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
}

extension AppsHeaderHorizontalController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height)
    }
}

