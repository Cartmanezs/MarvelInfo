//
//  CharactersRequest.swift
//  Marvel info
//
//  Created by Ingvar on 30.04.2020.
//  Copyright © 2020 Igor. All rights reserved.
//

import Foundation

enum CharacterError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct CharactersRequest {
    let resourceURL: URL
    let APIKEY = "7fe5f1ccd15a5b491fc23e8094c8f18d"
    
    init() {
        let resourceString = "http://gateway.marvel.com/v1/public/characters?api_key=\(APIKEY)"

        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
        
    
    func getCharacters(completion: @escaping(Result<[CharactersInfo], CharacterError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return }
            do {
                let decoder = JSONDecoder()
                let charactersResponse = try decoder.decode(CharactersResponse.self, from: jsonData)
                let charachterInfo = charactersResponse.response.characters
                completion(.success(charachterInfo))
               // completion(.success(charachterData!))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()

    }

}
