//
//  PhotosResponseDTO.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation

//{
//  "albumId": 100,
//  "id": 4992,
//  "title": "accusamus dolore enim quis necessitatibus voluptatibus",
//  "url": "https://via.placeholder.com/600/de1377",
//  "thumbnailUrl": "https://via.placeholder.com/150/de1377"
//}


struct PhotosResponseDTO: Decodable {
    let id, albumId: Int
    let title, url, thumbnailUrl: String
}

extension PhotosResponseDTO {
    func toPhoto() -> Photo {
        return .init(id: id,
                     albumId: albumId,
                     title: title,
                     highResURL: url,
                     lowResURL: thumbnailUrl)
    }
}
