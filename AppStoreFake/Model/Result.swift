//
//  SearchResult.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 13/10/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import Foundation

struct SearchResult {
    let resultCount: Int
    let results: [Result]
}

struct Result {
    let trackName: String
    let primaryGenreName: String
}
