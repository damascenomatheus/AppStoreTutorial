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
        return imageView
    }()
    
    let appTitle = UILabel(title: "App Name")
    let categoryLabel = UILabel(title: "Photos & Video")
    let ratingsLabel = UILabel(title: "9.26M")
    let getButton = CustomButton(type: .system)
    let horizontalStackView = UIStackView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.spacing = 12
        horizontalStackView.addArrangedSubviews([
            appImage,
            appTitle,
            getButton
        ])
        
        addSubview(horizontalStackView)
        NSLayoutConstraint.activate([
            horizontalStackView.heightAnchor.constraint(equalToConstant: 50),
            horizontalStackView.widthAnchor.constraint(equalToConstant: frame.width)
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            appImage.widthAnchor.constraint(equalToConstant: 64),
            getButton.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
    
}
