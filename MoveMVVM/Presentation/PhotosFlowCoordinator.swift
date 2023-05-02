//
//  PhotosFlowCoordinator.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation
import UIKit

final class PhotosFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: PhotosFlowCoordinatorDependencies

    private weak var photosListViewController: PhotosListViewController?

    init(navigationController: UINavigationController,
         dependencies: PhotosFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let actions = PhotosListViewModelActions(showPhotoDetail: showPhotoDetail)
        let photosController = dependencies.createPhotosListViewController(actions: actions)

        navigationController?.pushViewController(photosController, animated: false)
        photosListViewController = photosController
    }

    func showPhotoDetail(photo: Photo) {
        let vc = dependencies.createPhotoDetailViewController(photo: photo)
        navigationController?.pushViewController(vc, animated: true)
    }
}
