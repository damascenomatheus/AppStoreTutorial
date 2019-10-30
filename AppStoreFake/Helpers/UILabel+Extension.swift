//
//  UILabel+Extension.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 25/09/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(title: String, font: UIFont, color: UIColor) {
        self.init()
        self.text = title
        self.font = font
        self.textColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
