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
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    let appTitle = UILabel(title: "App Name", fontSize: 18, color: .black)
    let categoryLabel = UILabel(title: "Photos & Video", fontSize: 16, color: .black)
    let ratingsLabel = UILabel(title: "9.26M", fontSize: 16, color: .lightGray)
    let getButton = CustomButton(type: .system)
    let horizontalStackView = UIStackView()
    let verticalStackView = UIStackView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupStackView()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy(){
        addSubviews([horizontalStackView,verticalStackView])
    }
    
    func setupStackView() {
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.spacing = 12
        horizontalStackView.alignment = .center
        
        horizontalStackView.addArrangedSubviews([
            appImage,
            verticalStackView,
            getButton
        ])
        
        verticalStackView.addArrangedSubviews([
            appTitle,
            categoryLabel,
            ratingsLabel
        ])
        verticalStackView.axis = .vertical
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            appImage.widthAnchor.constraint(equalToConstant: 64),
            appImage.heightAnchor.constraint(equalToConstant: 64),
            getButton.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
    
}
