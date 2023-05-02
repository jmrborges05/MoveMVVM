//
//  PhotoListTableViewCellViewController.swift
//  MoveMVVM
//
//  Created by João Borges on 03/05/2023.
//  Copyright (c) 2023 All rights reserved.
//

import UIKit
import Kingfisher

class PhotoListTableViewCell: UITableViewCell {
    static let reuseIdentifier = String(describing: PhotoListTableViewCell.self)
    var viewModel: PhotoListTableViewCellViewModel? {
        didSet {
            titleLabel.text = viewModel?.title
            guard let thumbnail = viewModel?.thumbnailImage else { return }
            let url = URL(string: thumbnail)
            imageContainer.kf.setImage(
                with: url,
                options: [
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ]
            )
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var imageContainer: UIImageView = {
        let container = UIImageView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageContainer.image = nil
        titleLabel.text = nil
    }
    
    func bind(to viewModel: PhotoListTableViewCellViewModel) {

    }
    
    func setupView() {
        
        contentView.addSubview(imageContainer)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
    }
}
