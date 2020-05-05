//
//  CharactersRequest.swift
//  Marvel info
//
//  Created by Ingvar on 01.05.2020.
//  Copyright © 2020 Igor. All rights reserved.
//

import Foundation

class CharactersRequest {
    
    static let shared = CharactersRequest()

    let resourceURL: URL
    let APIKEY = "7fe5f1ccd15a5b491fc23e8094c8f18d"

    private init?() {
        let resourceString = "http://gateway.marvel.com/v1/public/characters?api_key=\(APIKEY)"
        guard let resourceURL = URL(string: resourceString) else { print("URL not found")
            return nil
        }
        self.resourceURL = resourceURL
    }

    func genericFetch<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
    
            if let data = data {
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(model))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
}
