//
//  AppsGroupCell.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 29/10/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    let titleSectionLabel = UILabel(title: "App Section", font: .boldSystemFont(ofSize: 30), color: .black)
    let horizontalController = UIViewController()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        horizontalController.view.backgroundColor = .blue
        horizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        buildViewHierarchy()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func buildViewHierarchy(){
        addSubviews([titleSectionLabel, horizontalController.view])
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            titleSectionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleSectionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            titleSectionLabel.widthAnchor.constraint(equalToConstant: frame.width),
                    
            horizontalController.view.topAnchor.constraint(equalTo: titleSectionLabel.bottomAnchor),
            horizontalController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalController.view.bottomAnchor.constraint(equalTo: bottomAnchor),
            horizontalController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
}
