//
//  PhotosRepository.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation

protocol PhotosRepository {
    func loadImagesList(completion: @escaping (Result<[Photo], Error>) -> Void)
}
