//
//  PhotoListTableViewCellViewModel.swift
//  MoveMVVM
//
//  Created by João Borges on 03/05/2023.
//  Copyright (c) 2023 All rights reserved.
//

import Foundation

protocol PhotoListTableViewCellViewModelInput {
}

protocol PhotoListTableViewCellViewModelOutput {
    var title: String { get }
    var thumbnailImage:String { get }
    
}

protocol PhotoListTableViewCellViewModel: PhotoListTableViewCellViewModelInput, PhotoListTableViewCellViewModelOutput { }

class DefaultPhotoListTableViewCellViewModel: PhotoListTableViewCellViewModel {
    
    private var item:Photo
    
    var title: String {
        item.title
    }
    
    var thumbnailImage: String {
        item.lowResURL
    }
    
    init(photo: Photo) {
        self.item = photo
    }
}

// MARK: - INPUT. View event methods
extension DefaultPhotoListTableViewCellViewModel {}
