//
//  Photo.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation

struct Photo: Equatable, Identifiable {
    let id, albumId: Int
    let title, highResURL, lowResURL: String
}
