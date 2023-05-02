//
//  PhotoListTableViewCellViewModel.swift
//  MoveMVVM
//
//  Created by João Borges on 03/05/2023.
//  Copyright (c) 2023 All rights reserved.
//

import Foundation

protocol PhotoListTableViewCellViewModelInput {
    func viewDidLoad()
}

protocol PhotoListTableViewCellViewModelOutput {
    
}

protocol PhotoListTableViewCellViewModel: PhotoListTableViewCellViewModelInput, PhotoListTableViewCellViewModelOutput { }

class DefaultPhotoListTableViewCellViewModel: PhotoListTableViewCellViewModel {
    
    // MARK: - OUTPUT

}

// MARK: - INPUT. View event methods
extension DefaultPhotoListTableViewCellViewModel {
    func viewDidLoad() {
    }
}
