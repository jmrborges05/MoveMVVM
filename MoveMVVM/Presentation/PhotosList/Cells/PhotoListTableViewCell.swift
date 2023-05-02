//
//  PhotoListTableViewCellViewController.swift
//  MoveMVVM
//
//  Created by João Borges on 03/05/2023.
//  Copyright (c) 2023 All rights reserved.
//

import UIKit

class PhotoListTableViewCellViewController: UITableViewCell {
    static let reuseIdentifier = String(describing: PhotoListTableViewCellViewController.self)
    var viewModel: PhotoListTableViewCellViewModel!
    
    
    
    class func create(with viewModel: PhotoListTableViewCellViewModel) -> PhotoListTableViewCellViewController {
        let vc = PhotoListTableViewCellViewController.instantiateViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel)
        viewModel.viewDidLoad()
    }
    
    func bind(to viewModel: PhotoListTableViewCellViewModel) {

    }
}
