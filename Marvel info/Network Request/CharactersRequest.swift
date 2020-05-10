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
     var resourceURL: URL
     let resourceString = "http://gateway.marvel.com/v1/public/characters?api_key=7fe5f1ccd15a5b491fc23e8094c8f18d"
    
    private init() {
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }

    func genericFetch<T: Decodable>(completion: @escaping (T) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, response, error) in
            if let data = data, data.count != 0, error == nil {
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    completion(model)
                } catch {
                    print("error")
                }
            }
        }
        dataTask.resume()
    }
}
