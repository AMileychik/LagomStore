//
//  RecentlyViewedCollectionViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/30/24.
//

import UIKit

class RecentlyViewedCollectionViewCell: UICollectionViewCell {
    
    private let photoImageView = ImageView(type: .recentlyViewed)
    private let nameLabel = Label(type: .description)
    private let descriptionLabel = Label(type: .description)
    private let priceLabel = Label(type: .description)
    
    private let horizontalStackView = StackView(type: .productCell)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Public
extension RecentlyViewedCollectionViewCell {
    
    func updateRecentlyViewed(_ model: TopPickModel) {
        photoImageView.image = UIImage(named: model.image)
        nameLabel.text = model.description
        descriptionLabel.text = model.type
        priceLabel.text = model.price
    }
}

//MARK: - Layout
extension RecentlyViewedCollectionViewCell {
    
    func setupViews() {
        backgroundColor = .systemBackground
        contentView.addSubview(photoImageView)
        contentView.addSubview(horizontalStackView)
        
        horizontalStackView.addArrangedSubview(nameLabel)
        horizontalStackView.addArrangedSubview(descriptionLabel)
        horizontalStackView.addArrangedSubview(priceLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            horizontalStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
