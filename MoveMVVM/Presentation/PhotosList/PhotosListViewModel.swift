//
//  PhotosListViewModel.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//  Copyright (c) 2023 All rights reserved.
//

import Foundation
import Combine

struct PhotosListViewModelActions {
    let showPhotoDetail: (Photo) -> Void
}

protocol PhotosListViewModelInput {
    func viewDidLoad()
    func didChooseItem(at index:Int)
    func loadData()
}

protocol PhotosListViewModelOutput {
    var photos:[Photo] { get set }
    var photosPublisher: Published<[Photo]>.Publisher { get }
    var isLoadingPublisher: Published<Bool>.Publisher { get }
}

protocol PhotosListViewModel: PhotosListViewModelInput, PhotosListViewModelOutput { }

class DefaultPhotosListViewModel: PhotosListViewModel {
    
    private let actions:PhotosListViewModelActions?
    private let useCase: PhotosUseCase
    
    @Published var photos: [Photo] = []
    @Published var isLoading: Bool = false
    var photosPublisher: Published<[Photo]>.Publisher { $photos }
    var isLoadingPublisher: Published<Bool>.Publisher { $isLoading }
    
    init(actions: PhotosListViewModelActions?,
         useCase: PhotosUseCase) {
        self.actions = actions
        self.useCase = useCase
    }
    
}

// MARK: - OUTPUT
extension DefaultPhotosListViewModel {
    
}


// MARK: - INPUT. View event methods
extension DefaultPhotosListViewModel {
    func viewDidLoad() {
        loadData()
    }
    
    func didChooseItem(at index: Int) {
        actions?.showPhotoDetail(photos[index])
    }
    
    func loadData() {
        isLoading = true
        useCase.loadImagesList { [weak self] response in
            self?.isLoading = false
            switch response {
            case .success(let value):
                self?.photos = value.sorted(by: { $0.title < $1.title })
            case .failure(let error): break
            }
        }
    }
}
