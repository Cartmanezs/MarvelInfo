//
//  CharactersRequest.swift
//  Marvel info
//
//  Created by Ingvar on 01.05.2020.
//  Copyright © 2020 Igor. All rights reserved.
//

import Foundation

class CharactersRequest {
    
    let resourceURL: URL
    let APIKEY = "7fe5f1ccd15a5b491fc23e8094c8f18d"
    
    init() {
        let resourceString = "http://gateway.marvel.com/v1/public/characters?api_key=\(APIKEY)"

        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }

    func getCharacters<T: Decodable>(data: String, completion: @escaping (Result<T, Error>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, response, error) in
            if let error = error {
                print("error: \(error.localizedDescription)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("status code: \(response.statusCode)")
                }
            }
            if let data = data,
               let dataString = String(data: data, encoding: .utf8) {
                    do {
                        print("data: \(dataString)")
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
