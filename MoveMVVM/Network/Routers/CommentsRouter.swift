//
//  CommentsRouter.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation
import Alamofire

enum CommentsRouter: URLRequestConvertible {
    case get(Int)

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
        var url = baseURL.appendingPathComponent(path)
        
        
        switch self {
        case let .get(id):
            url = url.appendingPathComponent("\(id)")
            url = url.appendingPathComponent("comments")
        }
        
        var request = URLRequest(url: url)
        request.method = method
        
        return request
    }
}
