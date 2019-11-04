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
        return imageView
    }()
    
    let titleLabel = UILabel(title: "Title", font: .boldSystemFont(ofSize: 18), color: .black)
    let categoryLabel = UILabel(title: "Photos & Videos", font: .boldSystemFont(ofSize: 14), color: .black)
    let ratingLabel = UILabel(title: "Rating: 5.0", font: .boldSystemFont(ofSize: 14), color: .lightGray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func buildViewHierarchy() {
        addSubviews([appImage])
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            appImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            appImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            appImage.heightAnchor.constraint(equalToConstant: 64),
            appImage.widthAnchor.constraint(equalToConstant: 64)
        
        
        ])
    }
    
    fileprivate func setupStackViews() {
        
    }
}
