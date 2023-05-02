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
}

class PhotosSceneDIContainer: PhotosFlowCoordinatorDependencies {
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
    func createPhotosListViewModel(actions:PhotosListViewModelActions) -> PhotosListViewModel {
        DefaultPhotosListViewModel(actions: actions)
    }
    
    func createPhotoDetailViewModel(photo:Photo) -> PhotoDetailViewModel {
        DefaultPhotoDetailViewModel(photo: photo)
    }
    
    func createPhotosFlowCoordinator(navigationController: UINavigationController) -> PhotosFlowCoordinator {
        PhotosFlowCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
}

