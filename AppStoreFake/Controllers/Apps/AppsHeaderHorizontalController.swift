//
//  AppsHeaderHorizontalController.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 22/11/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit
import SDWebImage

class AppsHeaderHorizontalController: HorizontalSnappingController {
    
    fileprivate let cellId = "cell"
    var headerData = [HeaderData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellId)
    }
     
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsHeaderCell
        let headerDataItem = headerData[indexPath.item]
        cell.companyLabel.text = headerDataItem.name
        cell.mainImage.sd_setImage(with: URL(string: headerDataItem.imageUrl), completed: nil)
        cell.titleLabel.text = headerDataItem.tagline
        return cell
    }
}

extension AppsHeaderHorizontalController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width-32, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 8, bottom: 0, right: 8)
    }
}

