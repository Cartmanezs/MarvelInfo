//
//  CharactersRequest.swift
//  Marvel info
//
//  Created by Ingvar on 30.04.2020.
//  Copyright © 2020 Igor. All rights reserved.
//

import Foundation

struct CharactersRequest {
    let resourceURL: URL
    let APIKEY = "7fe5f1ccd15a5b491fc23e8094c8f18d"
    
    init() {
        let resourceString = "http://gateway.marvel.com/v1/public/characters?api_key=\(APIKEY)"

        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func getCharacters(completion: @escaping(Result<[CharactersData], Error>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let jsonData = data else { print("error")
                return }
            do {
                let decoder = JSONDecoder()
                let charactersResponse = try decoder.decode(CharactersResponse.self, from: jsonData)
                let charachterData = charactersResponse.response.characters
                completion(.success(charachterData))
            } catch {
                print("THERE IS NO JSON DATA")
            }
        }
        dataTask.resume()

    }
}
