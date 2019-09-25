//
//  SearchCollectionCell.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 23/09/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

class SearchCollectionCell: UICollectionViewCell {
    
    let appImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let appTitle = UILabel(title: "App Name")
    let appSubTitle = UILabel(title: "App Description")
    let getButton = CustomButton(type: .system)
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([appImage,appTitle,appSubTitle, getButton])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            appImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            appImage.heightAnchor.constraint(equalToConstant: 44),
            appImage.widthAnchor.constraint(equalToConstant: 44),
            appImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        
            appTitle.topAnchor.constraint(equalTo: appImage.topAnchor),
            appTitle.widthAnchor.constraint(equalToConstant: self.frame.width),
            appTitle.heightAnchor.constraint(equalToConstant: 20),
            appTitle.leadingAnchor.constraint(equalTo: appImage.trailingAnchor, constant: 8),
        
            appSubTitle.topAnchor.constraint(equalTo: appTitle.bottomAnchor, constant: 4),
            appSubTitle.leadingAnchor.constraint(equalTo: appImage.trailingAnchor, constant: 8),
            appSubTitle.widthAnchor.constraint(equalToConstant: self.frame.width),
            appSubTitle.heightAnchor.constraint(equalToConstant: 20),
            
            getButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            getButton.heightAnchor.constraint(equalToConstant: 20),
            getButton.widthAnchor.constraint(equalToConstant: 50),
            getButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
            
        ])
    }
    
}
