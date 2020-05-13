//
//  DataFetcherService.swift
//  Marvel info
//
//  Created by Ingvar on 11.05.2020.
//  Copyright © 2020 Igor. All rights reserved.
//

import Foundation
import CryptoSwift

class DataFetcherService {
    
    var dataFetcher: DataFetcher
    
    private let publicKey = "7fe5f1ccd15a5b491fc23e8094c8f18d"
    private let privatekey = "400dc9807583ec136db3685d5d913f6cfc44ca56"
    private let baseURLString = "https://gateway.marvel.com:443/v1/public/"
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchCharacters(completion: @escaping (AppGroup?) -> Void) {
        let charactersURL = self.addAuthorization(url: baseURLString + "/characters")
        dataFetcher.fetchGenericJSONData(urlString: charactersURL, response: completion)
    }
    
    func fetchСomics(completion: @escaping (AppGroup?) -> Void) {
        let comicsURL = self.addAuthorization(url: baseURLString + "/comics")
        dataFetcher.fetchGenericJSONData(urlString: comicsURL, response: completion)
    }
    
    private func addAuthorization(url: String) -> String {
        let ts = String(Int.random(in: Int.min...Int.max))
        let hash = (ts + privatekey + publicKey).md5()
        let authorizedUrl = url + "?apikey=\(publicKey)&ts=\(ts)&hash=\(hash)"
        
        return authorizedUrl
    }
}
