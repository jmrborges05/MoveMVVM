//
//  DefaultCommentsRepository.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation
import Alamofire

final class DefaultCommentsRepository {
    private let networkHandler: NetworkHandlerService
    
    init(networkHandler: NetworkHandlerService) {
        self.networkHandler = networkHandler
    }
}

extension DefaultCommentsRepository: CommentsRepository {
    func loadComments(for id: Int, completion: @escaping (Result<[Comment], Error>) -> Void) {
        do {
            let request = try CommentsRouter.get(id).asURLRequest()
            networkHandler.performRequest(type: [CommentsResponseDTO].self,
                                          request: request) { response in
                switch response {
                case .success(let value):
                    completion(.success(value.map { $0.toComment() } ) )
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
}
