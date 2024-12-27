//
//  NearbyStoresCollectionViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/22/24.
//

import UIKit

class NearbyStoresCollectionViewCell: UICollectionViewCell {
    
    private let photoImageView = ImageView(type: .nearbySection)
    private let nameLabel = Label(type: .description)
    private let descriptionLabel = Label(type: .description)
    
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
extension NearbyStoresCollectionViewCell {
    
    func updateNearbyStoreSection(_ model: ThankYouModel) {
        photoImageView.image = UIImage(named: model.image)
    }
}

//MARK: - Layout
extension NearbyStoresCollectionViewCell {
    
    func setupViews() {
        backgroundColor = .systemBackground
        contentView.addSubview(photoImageView)
        contentView.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(nameLabel)
        horizontalStackView.addArrangedSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            photoImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            horizontalStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
