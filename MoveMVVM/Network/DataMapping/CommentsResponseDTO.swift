//
//  CommentsResponseDTO.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//

import Foundation

//{
//  "postId": 2,
//  "id": 6,
//  "name": "et fugit eligendi deleniti quidem qui sint nihil autem",
//  "email": "Presley.Mueller@myrl.com",
//  "body": "doloribus at sed quis culpa deserunt consectetur qui praesentium\naccusamus fugiat dicta\nvoluptatem rerum ut voluptate autem\nvoluptatem repellendus aspernatur dolorem in"
//}

struct CommentsResponseDTO: Decodable {
    let id, postId: Int
    let name, email, body: String
}

extension CommentsResponseDTO {
    func toComment() -> Comment {
        return .init(id: id,
                     postId: postId,
                     title: name,
                     body: body,
                     author: email)
    }
}
