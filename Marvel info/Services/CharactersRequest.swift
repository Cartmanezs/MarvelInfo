//
//  CharactersRequest.swift
//  Marvel info
//
//  Created by Ingvar on 01.05.2020.
//  Copyright © 2020 Igor. All rights reserved.
//

import Foundation

class NetworkService: Networking {
    
    func request(urlString: String, completion: @escaping (Data?, ErrorType?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, ErrorType.optionalUnwrapError)
            return }
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from requst: URLRequest, completion: @escaping (Data?, ErrorType?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: requst, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, .noData)
            }
        })
    }
}
