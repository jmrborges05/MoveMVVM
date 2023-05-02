//
//  AppConfigs.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation

final class AppConfigs {
    lazy var apiBaseURL: String = {
        guard let baseURL = Bundle.main.object(forInfoDictionaryKey: "baseDomain") as? String else {
            fatalError("baseDomain need to be defined in plist file")
        }
        return baseURL
    }()
}
