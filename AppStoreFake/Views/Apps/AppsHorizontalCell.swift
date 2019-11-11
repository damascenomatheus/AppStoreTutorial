//
//  AppHorizontalCell.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 04/11/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

class AppsHorizontalCell: UICollectionViewCell {
    
    let appImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let titleLabel = UILabel(title: "Life is Strange", font: .systemFont(ofSize: 18), color: .black)
    let publisherLabel = UILabel(title: "Square Enix INC", font: .systemFont(ofSize: 12), color: .lightGray)
    
    let getButton = CustomButton(title: "GET", fontSize: 14, backgroundColor: #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
    
    let labelStackView = VerticalStackView(spacing: 0)
    let cellStackView = UIStackView(status: false)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cellStackView)
        setupStackViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupStackViews() {
        cellStackView.spacing = 12
        cellStackView.alignment = .center
        
        labelStackView.addArrangedSubviews([
            titleLabel,
            publisherLabel
        ])
        
        cellStackView.addArrangedSubviews([
            appImage,
            labelStackView,
            getButton
        ])
        
        
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            cellStackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            cellStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cellStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            appImage.heightAnchor.constraint(equalToConstant: 64),
            appImage.widthAnchor.constraint(equalToConstant: 64),
        
            getButton.widthAnchor.constraint(equalToConstant: 80),
            getButton.heightAnchor.constraint(equalToConstant: 32),
            getButton.centerYAnchor.constraint(equalTo: appImage.centerYAnchor),
            
        ])
    }
    
    
}
