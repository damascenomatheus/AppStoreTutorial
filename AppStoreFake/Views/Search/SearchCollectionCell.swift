//
//  SearchCollectionCell.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 23/09/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

class SearchCollectionCell: UICollectionViewCell {
    
    var appResult: Result! {
        didSet {
            appTitle.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            ratingsLabel.text = "\((appResult.averageUserRating) ?? 0) ★"
                   
            let urlIcon = URL(string: appResult.artworkUrl100)
            let urlScreenshot1 = URL(string: appResult.screenshotUrls[0])
            appImage.sd_setImage(with: urlIcon)
            screenshotImage1.sd_setImage(with: urlScreenshot1)
                  
            if appResult.screenshotUrls.count > 1 {
                let urlScreenshot2 = URL(string: appResult.screenshotUrls[1])
                screenshotImage2.sd_setImage(with: urlScreenshot2)
            }
            if appResult.screenshotUrls.count > 2 {
                let urlScreenshot3 = URL(string: appResult.screenshotUrls[2])
                screenshotImage3.sd_setImage(with: urlScreenshot3)
            }
        }
    }
    
    let appImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let appTitle = UILabel(title: "App Name", font: .systemFont(ofSize: 18), color: .black)
    let categoryLabel = UILabel(title: "Photos & Video", font: .systemFont(ofSize: 14), color: .black)
    let ratingsLabel = UILabel(title: "9.26M", font: .systemFont(ofSize: 14), color: .lightGray)
    let getButton = CustomButton(title: "GET", backgroundColor: #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
    let infoStackView = UIStackView(status: false)
    let labelsStackView = VerticalStackView(spacing: 0)
    let screenshotStackView = UIStackView(status: false)
    let cellStackView = VerticalStackView(spacing: 16)
    
    lazy var screenshotImage1 = self.createScreenshotImageView()
    lazy var screenshotImage2 = self.createScreenshotImageView()
    lazy var screenshotImage3 = self.createScreenshotImageView()
    
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.layer.borderWidth = 0.5
        imageView.contentMode = .scaleAspectFill
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
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cellStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cellStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cellStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            appImage.widthAnchor.constraint(equalToConstant: 64),
            appImage.heightAnchor.constraint(equalToConstant: 64),
            
            getButton.widthAnchor.constraint(equalToConstant: 50),
            getButton.heightAnchor.constraint(equalToConstant: 22),
            getButton.centerYAnchor.constraint(equalTo: infoStackView.centerYAnchor)
        ])
    }
    
}
