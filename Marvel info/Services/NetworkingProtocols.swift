//
//  NetworkingProtocol.swift
//  Marvel info
//
//  Created by Ingvar on 13.05.2020.
//  Copyright © 2020 Igor. All rights reserved.
//

import Foundation

protocol Networking {
    func request(urlString: String, completion: @escaping (Data?, ErrorType?) -> Void)
}

protocol DataFetcher {
    func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void)
}

enum ErrorType: Error {
    case optionalUnwrapError
    case noData
}
