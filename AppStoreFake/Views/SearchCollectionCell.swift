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
    let infoStackView = UIStackView(false)
    let labelsStackView = VerticalStackView(spacing: 0)
    let screenshotStackView = UIStackView(false)
    let cellStackView = VerticalStackView(spacing: 16)
    
    lazy var screenshotImage1 = self.createScreenshotImageView()
    lazy var screenshotImage2 = self.createScreenshotImageView()
    lazy var screenshotImage3 = self.createScreenshotImageView()
    
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
        
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
        addSubviews([infoStackView,labelsStackView,screenshotStackView,cellStackView])
    }
    
    func setupStackView() {
        screenshotStackView.distribution = .fillEqually
        screenshotStackView.spacing = 12

        infoStackView.spacing = 12
        infoStackView.alignment = .center
        
        
        infoStackView.addArrangedSubviews([
            appImage,
            labelsStackView,
            getButton
        ])
        
        labelsStackView.addArrangedSubviews([
            appTitle,
            categoryLabel,
            ratingsLabel
        ])
        
        
        screenshotStackView.addArrangedSubviews([
            screenshotImage1,
            screenshotImage2,
            screenshotImage3
        ])
        
        cellStackView.addArrangedSubviews([
            infoStackView,
            screenshotStackView
        ])
    }
    
    func setupConstraints() {
        
        cellStackView.cBuilder{ make in
            make.top.equal(to: topAnchor)
            make.bottom.equal(to: bottomAnchor)
            make.leading.equal(to: leadingAnchor, offsetBy: 16)
            make.trailing.equal(to: trailingAnchor, offsetBy: -16)
        }
        
        appImage.cBuild(width: 64)
        appImage.cBuild(height: 64)
        
        getButton.cBuild(width: 80)
        getButton.cBuild(height: 32)
        
        
        
//        
//        NSLayoutConstraint.activate([
//            cellStackView.topAnchor.constraint(equalTo: topAnchor),
//            cellStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            cellStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            cellStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            
//            appImage.widthAnchor.constraint(equalToConstant: 64),
//            appImage.heightAnchor.constraint(equalToConstant: 64),
//            
//            getButton.widthAnchor.constraint(equalToConstant: 80),
//            getButton.heightAnchor.constraint(equalToConstant: 32),
//        ])
    }
    
}
