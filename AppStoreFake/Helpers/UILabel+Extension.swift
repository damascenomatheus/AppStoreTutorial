//
//  UILabel+Extension.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 25/09/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(title: String, fontSize: CGFloat, color: UIColor) {
        self.init()
        text = title
        font = UIFont(name: "Helvetica", size: fontSize)
        textColor = color
        translatesAutoresizingMaskIntoConstraints = false
    }
}
