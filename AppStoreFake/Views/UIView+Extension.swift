//
//  UIView+Extension.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 23/09/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { (view) in
            self.addSubview(view)
        }
    }
}
