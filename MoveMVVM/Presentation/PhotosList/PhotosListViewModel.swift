//
//  PhotosListViewModel.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//  Copyright (c) 2023 All rights reserved.
//

import Foundation

struct PhotosListViewModelActions {
    let showPhotoDetail: (Photo) -> Void
}

protocol PhotosListViewModelInput {
    func viewDidLoad()
    func didChooseItem(at index:Int)
}

protocol PhotosListViewModelOutput {
    var photos:[Photo] { get }
}

protocol PhotosListViewModel: PhotosListViewModelInput, PhotosListViewModelOutput { }

class DefaultPhotosListViewModel: PhotosListViewModel {
    
    private let actions:PhotosListViewModelActions?
    
    var photos: [Photo] = []
    
    init(actions:PhotosListViewModelActions?) {
        self.actions = actions 
    }
    
    
    

}

// MARK: - OUTPUT
extension DefaultPhotosListViewModel {

}


// MARK: - INPUT. View event methods
extension DefaultPhotosListViewModel {
    func viewDidLoad() {
    }
    
    func didChooseItem(at index: Int) {
        actions?.showPhotoDetail(photos[index])
    }
}
