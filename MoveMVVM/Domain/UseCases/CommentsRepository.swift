//
//  CommentsRepository.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation

protocol CommentsRepository {
    func loadComments(
        for id:Int,
        completion: @escaping (Result<[Comment], Error>) -> Void
    )
}
