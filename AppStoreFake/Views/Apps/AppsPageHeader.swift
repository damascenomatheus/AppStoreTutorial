//
//  AppsPageHeader.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 11/11/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    let controller = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func buildViewHierarchy() {
        addSubviews([controller.view])
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            controller.view.topAnchor.constraint(equalTo: self.topAnchor),
            controller.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            controller.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            controller.view.bottomAnchor.constraint(equalTo:  self.bottomAnchor)
        
        ])
    }
    
    
}
