//
//  CharactersModel.swift
//  Marvel info
//
//  Created by Ingvar on 01.05.2020.
//  Copyright © 2020 Igor. All rights reserved.
//

import Foundation

struct CharactersResponse: Decodable {
    var response: Characters
}

struct Characters: Decodable {
    let characters:[CharactersInfo]
}


struct CharactersInfo: Decodable {
    let name: String?
    let description: String?
}
