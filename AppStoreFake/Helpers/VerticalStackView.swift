//
//  VerticalStackView.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 03/10/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {

    init(spacing: CGFloat) {
        super.init(frame: .zero)
        self.spacing = spacing
        self.axis = .vertical
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
}
