//
//  AppsHeaderCell.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 25/11/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabel = UILabel(title: "Facebook", font: .boldSystemFont(ofSize: 14), color: .systemBlue)
    
    let titleLabel = UILabel(title: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 24), color: .black)
    
    let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let headerStack = VerticalStackView(spacing: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.numberOfLines = 2
        addSubview(headerStack)
        setupConstraints()
        setupStack()
    }
    
    fileprivate func setupStack() {
        headerStack.addArrangedSubviews([
            companyLabel,
            titleLabel,
            mainImage        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            headerStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            headerStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    
}
