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
    
    func genericFetch<T: Decodable>(resourceURL: URL, modelType: T.Type,  completion:(T)) -> Void {
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, response, error) in
            guard let data = data else { return }
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                  //  completion(result)
                } catch {
                    print("error")
                }
             }
        dataTask.resume()
    }
}
