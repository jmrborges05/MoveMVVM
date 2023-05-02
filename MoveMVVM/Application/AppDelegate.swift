//
//  AppDelegate.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var flowCoordinator: FlowCoordinator?
    private let appDIContainer = AppDIContainer()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()

        window?.rootViewController = navigationController
        flowCoordinator = FlowCoordinator(
            navigationController: navigationController,
            appDIContainer: appDIContainer
        )
        flowCoordinator?.start()
        window?.makeKeyAndVisible()
        return true
    }
}

