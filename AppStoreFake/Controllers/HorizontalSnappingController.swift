//
//  HorizontalSnappingController.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 25/02/20.
//  Copyright © 2020 Matheus Damasceno. All rights reserved.
//

import UIKit

class HorizontalSnappingController: UICollectionViewController {
    
    init() {
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SnappingLayout: UICollectionViewFlowLayout {
    
    
}
