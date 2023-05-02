//
//  DefaultPhotosRepository.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation
import Alamofire

final class DefaultPhotosRepository {
    
    private let networkHandler: NetworkHandlerService
    
    init(networkHandler: NetworkHandlerService) {
        self.networkHandler = networkHandler
    }
}

extension DefaultPhotosRepository: PhotosRepository {
    func loadImagesList(completion: @escaping (Result<[Photo], Error>) -> Void) {
        do {
            let request = try PhotosRouter.get.asURLRequest()
            networkHandler.performRequest(type: [PhotosResponseDTO].self,
                                          request: request) { response in
                switch response {
                case .success(let value):
                    completion(.success(value.map { $0.toPhoto() } ) )
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
}

