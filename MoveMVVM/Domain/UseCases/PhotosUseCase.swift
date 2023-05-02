//
//  PhotosUseCase.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation

protocol PhotosUseCase {
    func loadImagesList(completion: @escaping (Result<[Photo], Error>) -> Void)
}

class DefaultPhotosUseCase {
    let repository: PhotosRepository

    init(
        photosRepository: PhotosRepository
    ) {
        self.repository = photosRepository
    }
}

extension DefaultPhotosUseCase: PhotosUseCase {
    func loadImagesList(completion: @escaping (Result<[Photo], Error>) -> Void) {
        repository.loadImagesList(completion: completion)
    }
}
