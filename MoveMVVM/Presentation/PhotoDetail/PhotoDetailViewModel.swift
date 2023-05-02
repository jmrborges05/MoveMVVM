//
//  PhotoDetailViewModel.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//  Copyright (c) 2023 All rights reserved.
//

import Foundation

protocol PhotoDetailViewModelInput {
    func viewDidLoad()
}

protocol PhotoDetailViewModelOutput {
    var title:String { get }
    var highResPhoto:String { get }
    var id: Int { get }
}

protocol PhotoDetailViewModel: PhotoDetailViewModelInput, PhotoDetailViewModelOutput { }

class DefaultPhotoDetailViewModel: PhotoDetailViewModel {
    
    let highResPhoto:String
    let title:String
    let id:Int
    
    var comments:[Any]?
    
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
    }
}
