//
//  CustomButton.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 24/09/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    var fontSize: CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        setTitle("GET", for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(title: String, fontSize: CGFloat, backgroundColor: UIColor) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        self.fontSize = fontSize
        self.backgroundColor = backgroundColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let title = titleLabel else { return }
        title.font = .boldSystemFont(ofSize: fontSize!)
        title.textColor = .systemBlue
        layer.cornerRadius = frame.height/2
    }
    
}
