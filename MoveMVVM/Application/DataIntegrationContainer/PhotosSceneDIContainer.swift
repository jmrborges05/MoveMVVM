//
//  PhotosSceneDIContainer.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation
import UIKit

protocol PhotosFlowCoordinatorDependencies  {
    func createPhotosListViewController(actions:PhotosListViewModelActions) -> PhotosListViewController
    func createPhotoDetailViewController(photo: Photo) -> PhotoDetailViewController
}

protocol PhotosFlowCordinatorConstructors {
    func createPhotosListViewModel(actions:PhotosListViewModelActions) -> PhotosListViewModel
    func createPhotoDetailViewModel(photo: Photo) -> PhotoDetailViewModel
    func createPhotosFlowCoordinator(navigationController: UINavigationController) -> PhotosFlowCoordinator
    
    // photos use case and repository
    func createPhotosUseCase() -> PhotosUseCase
    func createPhotosRepository() -> PhotosRepository
    // comments use case and repository
    func createCommentsUseCase() -> CommentsUseCase
    func createCommentsRepository() -> CommentsRepository
}

class PhotosSceneDIContainer: PhotosFlowCoordinatorDependencies {
    
    private var networkCaller: NetworkHandlerService
    
    init(networkCaller: NetworkHandlerService) {
        self.networkCaller = networkCaller
    }
    
    func createPhotosListViewController(actions:PhotosListViewModelActions) -> PhotosListViewController {
        PhotosListViewController.create(
            with: createPhotosListViewModel(actions: actions)
        )
    }
    
    func createPhotoDetailViewController(photo: Photo) -> PhotoDetailViewController {
        PhotoDetailViewController.create(
            with: createPhotoDetailViewModel(photo: photo)
        )
    }
}

extension PhotosSceneDIContainer: PhotosFlowCordinatorConstructors {
    func createCommentsUseCase() -> CommentsUseCase {
        DefaultCommentsUseCase(commentsRepository: createCommentsRepository())
    }
    
    func createCommentsRepository() -> CommentsRepository {
        DefaultCommentsRepository(networkHandler: networkCaller)
    }
    
    func createPhotosRepository() -> PhotosRepository {
        DefaultPhotosRepository(networkHandler: networkCaller)
    }
    
    func createPhotosUseCase() -> PhotosUseCase {
        DefaultPhotosUseCase(photosRepository: createPhotosRepository())
    }
    
    func createPhotosListViewModel(actions:PhotosListViewModelActions) -> PhotosListViewModel {
        DefaultPhotosListViewModel(actions: actions,
                                   useCase: createPhotosUseCase())
    }
    
    func createPhotoDetailViewModel(photo:Photo) -> PhotoDetailViewModel {
        DefaultPhotoDetailViewModel(photo: photo,
                                    commentsUseCase: createCommentsUseCase())
    }
    
    func createPhotosFlowCoordinator(navigationController: UINavigationController) -> PhotosFlowCoordinator {
        PhotosFlowCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
}

