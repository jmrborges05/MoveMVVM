//
//  AppConfigs.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation

final class AppConfigs {
    lazy var apiBaseURL: String = {
        guard let baseURL = Bundle.main.object(forInfoDictionaryKey: "api-base-url") as? String else {
            fatalError("api-base-url need to be defined in plist file")
        }
        return apiBaseURL
    }()
}
