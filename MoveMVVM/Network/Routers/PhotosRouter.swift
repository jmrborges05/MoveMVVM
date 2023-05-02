//
//  PhotosRouter.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation
import Alamofire

enum PhotosRouter: URLRequestConvertible {
    case get

    var baseURL: URL {
        return URL(string: AppConfigs().apiBaseURL)!
    }

    var method: HTTPMethod {
        switch self {
        case .get: return .get
        }
    }

    var path: String {
        switch self {
        case .get: return "photos"
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        return request
    }
}
