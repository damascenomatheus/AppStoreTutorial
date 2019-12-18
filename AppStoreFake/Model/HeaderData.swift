//
//  Header.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 17/12/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import Foundation

struct HeaderData: Decodable {
    let id: String
    let name: String
    let imageUrl: String
    let tagline: String
}
