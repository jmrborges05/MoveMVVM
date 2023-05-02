//
//  CommentsUseCase.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation

protocol CommentsUseCase {
    func loadComments(id: Int, completion: @escaping (Result<[Comment], Error>) -> Void)
}

class DefaultCommentsUseCase {
    private let repository: CommentsRepository

    init(
        commentsRepository: CommentsRepository
    ) {
        self.repository = commentsRepository
    }
}

extension DefaultCommentsUseCase: CommentsUseCase {
    func loadComments(id: Int, completion: @escaping (Result<[Comment], Error>) -> Void) {
        repository.loadComments(for: id, completion: completion)
    }
}
