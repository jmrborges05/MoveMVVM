//
//  CommentsTableViewCellViewModel.swift
//  MoveMVVM
//
//  Created by João Borges on 03/05/2023.
//

import Foundation

protocol CommentsTableViewCellViewModelInput {
}

protocol CommentsTableViewCellViewModelOutput {
    var title: String { get }
    var author: String { get }
    var body: String { get }
}

protocol CommentsTableViewCellViewModel: CommentsTableViewCellViewModelInput, CommentsTableViewCellViewModelOutput { }

class DefaultCommentsTableViewCellViewModel: CommentsTableViewCellViewModel {
    
    private var item:Comment
    
    var title: String {
        item.title
    }
    
    var author: String {
        "Author: \(item.author)"
    }
    
    var body: String {
        item.body
    }
    
    init(comment:Comment) {
        self.item = comment
    }
}

// MARK: - INPUT. View event methods
extension DefaultCommentsTableViewCellViewModel {}

