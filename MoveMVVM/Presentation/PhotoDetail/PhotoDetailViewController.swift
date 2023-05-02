//
//  PhotoDetailViewController.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//  Copyright (c) 2023 All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var viewModel: PhotoDetailViewModel!
    
    class func create(with viewModel: PhotoDetailViewModel) -> PhotoDetailViewController {
        let vc = PhotoDetailViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }
    
    func bind(to viewModel: PhotoDetailViewModel) {

    }
}
