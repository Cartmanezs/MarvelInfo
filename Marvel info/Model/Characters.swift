//
//  Characters.swift
//  Marvel info
//
//  Created by Ingvar on 30.04.2020.
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
