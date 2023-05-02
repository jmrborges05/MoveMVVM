//
//  Comment.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation


struct Comment: Equatable, Identifiable {
    let id, postId: Int
    let title, body, author: String
}
