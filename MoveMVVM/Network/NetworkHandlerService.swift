//
//  NetworkHandlerService.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation
import Alamofire


protocol NetworkHandlerService {
    func performRequest<Output: Decodable>(
        type: Output.Type,
        request: URLRequest,
        completionHandler: @escaping (Result<Output, Error>) -> Void
    )
}

class GenericApiCaller {
    init() {}
}

extension GenericApiCaller: NetworkHandlerService {
    func performRequest<Output: Decodable>(type: Output.Type, request: URLRequest, completionHandler: @escaping (Result<Output, Error>) -> Void) {
        AF.request(request).responseDecodable(of: Output.self, decoder: JSONDecoder()) { response in
            switch response.result {
            case .success(let value):
                completionHandler(.success(value))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }

    }
}
