//
//  PhotoDetailViewModel.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//  Copyright (c) 2023 All rights reserved.
//

import Foundation
import Combine

protocol PhotoDetailViewModelInput {
    func viewDidLoad()
    func loadData()
}

protocol PhotoDetailViewModelOutput {
    var title:String { get }
    var highResPhoto:String { get }
    var id: Int { get }
    
    var comments:[Comment] { get set }
    var commentsPublisher: Published<[Comment]>.Publisher { get }
    var isLoadingPublisher: Published<Bool>.Publisher { get }
}

protocol PhotoDetailViewModel: PhotoDetailViewModelInput, PhotoDetailViewModelOutput { }

class DefaultPhotoDetailViewModel: PhotoDetailViewModel {
    
    let highResPhoto:String
    let title:String
    let id:Int
    
    @Published var comments: [Comment] = []
    @Published var isLoading: Bool = false
    var commentsPublisher: Published<[Comment]>.Publisher { $comments }
    var isLoadingPublisher: Published<Bool>.Publisher { $isLoading }
    
    private let commentsUseCase: CommentsUseCase
    
    init(photo:Photo,
         commentsUseCase: CommentsUseCase) {
        self.highResPhoto = photo.highResURL
        self.title = photo.title
        self.id = photo.id
        self.commentsUseCase = commentsUseCase
    }
    
    // MARK: - OUTPUT

}

// MARK: - INPUT. View event methods
extension DefaultPhotoDetailViewModel {
    func viewDidLoad() {
        loadData()
    }
    
    func loadData() {
        isLoading = true
        commentsUseCase.loadComments(id: id) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let value):
                self?.comments = value
            case .failure(let error): break
            }

        }
    }
}
