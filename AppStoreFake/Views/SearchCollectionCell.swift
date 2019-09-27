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
    let categoryLabel = UILabel(title: "Photos & Video")
    let ratingsLabel = UILabel(title: "9.26M")
    let getButton = CustomButton(type: .system)
    let stackView = UIStackView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.addArrangedSubviews([
            appImage,
            appTitle,
            categoryLabel,
            ratingsLabel,
            getButton
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            appImage.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            appImage.heightAnchor.constraint(equalToConstant: 44),
            appImage.widthAnchor.constraint(equalToConstant: 44),
            appImage.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
        
            appTitle.topAnchor.constraint(equalTo: appImage.topAnchor),
            appTitle.widthAnchor.constraint(equalToConstant: self.frame.width),
            appTitle.heightAnchor.constraint(equalToConstant: 20),
            appTitle.leadingAnchor.constraint(equalTo: appImage.trailingAnchor, constant: 8),
        
            categoryLabel.topAnchor.constraint(equalTo: appTitle.bottomAnchor, constant: 4),
            categoryLabel.leadingAnchor.constraint(equalTo: appImage.trailingAnchor, constant: 8),
            categoryLabel.widthAnchor.constraint(equalToConstant: self.frame.width),
            categoryLabel.heightAnchor.constraint(equalToConstant: 20),
            
            getButton.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            getButton.heightAnchor.constraint(equalToConstant: 20),
            getButton.widthAnchor.constraint(equalToConstant: 50),
            getButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16)
        ])
    }
    
}
