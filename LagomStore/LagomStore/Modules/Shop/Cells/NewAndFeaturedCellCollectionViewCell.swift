//
//  NewAndFeaturedCellCollectionViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/27/24.
//

import UIKit

class NewAndFeaturedCellCollectionViewCell: UICollectionViewCell {
  
    private let photoImageView = ImageView(type: .newAndFeatured)
    private let nameLabel = Label(type: .description)
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
extension NewAndFeaturedCellCollectionViewCell {
    
    func updateNewAndFeaturedSection(_ model: TopPickModel) {
        photoImageView.image = UIImage(named: model.image)
        nameLabel.text = model.description
    }
}

//MARK: - Layout
extension NewAndFeaturedCellCollectionViewCell {
    
    func setupViews() {
        backgroundColor = .systemBackground
        contentView.addSubview(photoImageView)
        contentView.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(nameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            photoImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            horizontalStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

