//
//  PhotosListViewController.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//  Copyright (c) 2023 All rights reserved.
//

import UIKit
import Combine

class PhotosListViewController: UITableViewController {
    
    var viewModel: PhotosListViewModel!
    private var cancallables = Set<AnyCancellable>()
    
    class func create(with viewModel: PhotosListViewModel) -> PhotosListViewController {
        let vc = PhotosListViewController()
        vc.viewModel = viewModel
        vc.title = "Photos list"
        vc.tableView.register(PhotoListTableViewCell.self, forCellReuseIdentifier: PhotoListTableViewCell.reuseIdentifier)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }
    
    func bind(to viewModel: PhotosListViewModel) {
        viewModel.photosPublisher
               .receive(on: RunLoop.main)
               .sink(receiveValue: { [weak self] _ in
                   self?.tableView.reloadData()
               })
               .store(in: &cancallables)
    }
}


extension PhotosListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoListTableViewCell.reuseIdentifier, for: indexPath) as! PhotoListTableViewCell
        let viewModel = DefaultPhotoListTableViewCellViewModel(photo: viewModel.photos[indexPath.row])
        cell.viewModel = viewModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didChooseItem(at: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
