//
//  FlowCoordinator.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation
import UIKit

final class FlowCoordinator {

    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(
        navigationController: UINavigationController,
        appDIContainer: AppDIContainer
    ) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func start() {
        // In App Flow we can check if user needs to login, if yes we would run login flow
        let photosSceneContainer = appDIContainer.createPhotosSceneDIContainer()
        let flow = photosSceneContainer.createPhotosFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}

