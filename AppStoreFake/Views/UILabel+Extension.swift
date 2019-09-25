//
//  UILabel+Extension.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 25/09/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(title: String) {
        self.init()
        text = title
        translatesAutoresizingMaskIntoConstraints = false
    }
}
