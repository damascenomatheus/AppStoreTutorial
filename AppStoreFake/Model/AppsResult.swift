//
//  AppsResult.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 28/11/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

struct AppsResult: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [AppResults]
}

struct AppResults: Decodable {
    let name, artistName, artworkUrl100: String
}

