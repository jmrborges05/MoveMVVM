//
//  PhotoDetailViewController.swift
//  MoveMVVM
//
//  Created by João Borges on 02/05/2023.
//  Copyright (c) 2023 All rights reserved.
//

import UIKit
import Combine
import PureLayout

class PhotoDetailViewController: UIViewController {
    private var cancallables = Set<AnyCancellable>()
    var viewModel: PhotoDetailViewModel!
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var imageContainer: UIImageView = {
        let container = UIImageView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    lazy var commentsTableView: UITableView = {
        let container = UITableView(frame: .zero, style: .plain)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.dataSource = self
        container.register(CommentsTableViewCell.self, forCellReuseIdentifier: CommentsTableViewCell.reuseIdentifier)
        return container
    }()
    
    private var loadingView:UIActivityIndicatorView?
    private var refreshControl: UIRefreshControl?
    
    class func create(with viewModel: PhotoDetailViewModel) -> PhotoDetailViewController {
        let vc = PhotoDetailViewController()
        vc.viewModel = viewModel
        vc.titleLabel.text = viewModel.title
        
        let url = URL(string: viewModel.highResPhoto )
        vc.imageContainer.kf.setImage(
            with: url,
            options: [
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        )
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        view.backgroundColor = .white
        setupView()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }
    
    func handleLoader(isLoading:Bool = false) {
        if isLoading {
            loadingView?.stopAnimating()
            loadingView?.removeFromSuperview()
            refreshControl?.endRefreshing()
        } else {
            let loader = UIActivityIndicatorView(style: .large)
            loader.startAnimating()
            commentsTableView.addSubview(loader)
            loader.autoCenterInSuperview()
            loadingView = loader
        }
    }
    
    func setupView() {
        view.addSubview(imageContainer)
        view.addSubview(titleLabel)
        
        view.addSubview(commentsTableView)
        
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: view.topAnchor),
            imageContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageContainer.heightAnchor.constraint(equalToConstant: 320),
            
            titleLabel.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            commentsTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            commentsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            commentsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            commentsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh comments")
        refreshControl?.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        commentsTableView.refreshControl = refreshControl
    }
    
    @objc
    func reloadData() {
        viewModel.loadData()
    }
    
    func bind(to viewModel: PhotoDetailViewModel) {
        viewModel.commentsPublisher
               .receive(on: RunLoop.main)
               .sink(receiveValue: { [weak self] _ in
                   self?.commentsTableView.reloadData()
               })
               .store(in: &cancallables)
        
        viewModel.isLoadingPublisher
               .receive(on: RunLoop.main)
               .sink(receiveValue: { [weak self] loading in
                   self?.handleLoader(isLoading: loading)
               })
               .store(in: &cancallables)
    }
}

extension PhotoDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentsTableViewCell.reuseIdentifier, for: indexPath) as! CommentsTableViewCell
        
        let viewModel = DefaultCommentsTableViewCellViewModel(comment: viewModel.comments[indexPath.row])
        cell.viewModel = viewModel
        
        return cell
    }
    
    
}
