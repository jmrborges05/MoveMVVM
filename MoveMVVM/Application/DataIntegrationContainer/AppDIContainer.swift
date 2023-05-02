//
//  AppDIContainer.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation

final class AppDIContainer {
    
    lazy var appConfiguration = AppConfigs()
    
    // MARK: - Network
    private var networkCaler: NetworkHandlerService = GenericApiCaller()
    
    func createPhotosSceneDIContainer() -> PhotosSceneDIContainer {
        return PhotosSceneDIContainer(networkCaller: networkCaler)
    }
}
