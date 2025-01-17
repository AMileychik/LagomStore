//
//  TopPicksCollectionCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 1/13/25.
//

import UIKit

class TopPicksCollectionCell: UICollectionViewCell {
    
    private let photoImageView = ImageView(type: .product)
    private let nameLabel = Label(type: .name)
    private let descriptionLabel = Label(type: .description)
    private let priceLabel = Label(type: .subtitle)
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
extension TopPicksCollectionCell {
    func update(_ model: TopPickModel) {
        photoImageView.image = UIImage(named: model.image)
        nameLabel.text = model.type
        descriptionLabel.text = model.description
        priceLabel.text = model.price
    }
}

//MARK: - Layout
extension TopPicksCollectionCell {
    
    private func setupViews() {
        backgroundColor = .systemBackground
        horizontalStackView.axis = .vertical
        horizontalStackView.spacing = 4
        
        contentView.addSubview(photoImageView)
        contentView.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(nameLabel)
        horizontalStackView.addArrangedSubview(descriptionLabel)
        horizontalStackView.addArrangedSubview(priceLabel)
        
//        photoImageView.layer.borderColor = UIColor.gray.cgColor
//        photoImageView.layer.borderWidth = 0.5
//        photoImageView.clipsToBounds = true
//        photoImageView.layer.cornerRadius = 4
        
//        horizontalStackView.layer.borderColor = UIColor.green.cgColor
//        horizontalStackView.layer.borderWidth = 1
//        horizontalStackView.clipsToBounds = true
//        horizontalStackView.layer.cornerRadius = 4
    }
    
    private func setupConstraints() {

        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
//            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            horizontalStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 8),
//            horizontalStackView.widthAnchor.constraint(equalTo: photoImageView.widthAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
