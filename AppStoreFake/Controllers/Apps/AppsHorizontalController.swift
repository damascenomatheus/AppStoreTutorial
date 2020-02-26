//
//  AppsHorizontalController.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 30/10/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit
import SDWebImage

class AppsHorizontalController: HorizontalSnappingController {
    
    fileprivate let cellId = "cellId"
    var appsGroup: AppsResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
    
    fileprivate func setupCollection() {
        collectionView.backgroundColor = .white
        collectionView.register(AppsHorizontalCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appsGroup?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsHorizontalCell
        let appItem = appsGroup?.feed.results[indexPath.item]
        cell.titleLabel.text = appItem?.name
        cell.publisherLabel.text = appItem?.artistName
        cell.appImage.sd_setImage(with: URL(string: appItem?.artworkUrl100 ?? ""), completed: nil)
        return cell
    }
}

extension AppsHorizontalController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width-32, height: view.frame.height/3.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
}
