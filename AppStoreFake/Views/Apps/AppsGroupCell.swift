//
//  AppsGroupCell.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 29/10/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    let titleSectionLabel: UILabel = {
        let label = UILabel()
        label.text = "App Section"
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func buildViewHierarchy(){
        addSubviews([titleSectionLabel])
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            titleSectionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleSectionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            titleSectionLabel.heightAnchor.constraint(equalToConstant: 30),
            titleSectionLabel.widthAnchor.constraint(equalToConstant: frame.width),
        ])
    }
    
}