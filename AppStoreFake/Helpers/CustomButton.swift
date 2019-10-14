//
//  CustomButton.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 24/09/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        setTitle("GET", for: .normal)
        setTitleColor(.blue, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let title = titleLabel else { return }
        title.font = .boldSystemFont(ofSize: 13)
        title.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        layer.cornerRadius = frame.height/2
    }
    
}
