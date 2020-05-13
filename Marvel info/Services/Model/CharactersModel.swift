//
//  CharactersModel.swift
//  Marvel info
//
//  Created by Ingvar on 01.05.2020.
//  Copyright © 2020 Igor. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let data: Results?
}

struct Results: Decodable {
    let results: [CharactersInfo?]
}

struct CharactersInfo: Decodable {
    let name: String?
    let description: String?
    let thumbnail: Thumbnail?
}

struct Thumbnail: Decodable {
    let path: String?
    let imageExtension: String?
}
