//
//  PhotosListViewController.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//  Copyright (c) 2023 All rights reserved.
//

import UIKit

class PhotosListViewController: UITableViewController {
    
    var viewModel: PhotosListViewModel!
    
    class func create(with viewModel: PhotosListViewModel) -> PhotosListViewController {
        let vc = PhotosListViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel)
        viewModel.viewDidLoad()
    }
    
    func bind(to viewModel: PhotosListViewModel) {

    }
}
