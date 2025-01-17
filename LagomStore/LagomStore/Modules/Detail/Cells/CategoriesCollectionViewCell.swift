//
//  CategoriesCollectionViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/14/24.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    private let categoriesImageView = ImageView(type: .banner)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public
extension CategoriesCollectionViewCell {
    func updateCategories(_ model: Categories) {
        categoriesImageView.image = UIImage(named: model.image2)
    }
}

// MARK: - Layout
extension CategoriesCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(categoriesImageView)
        
        categoriesImageView.layer.borderColor = UIColor.black.cgColor
        categoriesImageView.layer.borderWidth = 1
        categoriesImageView.clipsToBounds = true
        categoriesImageView.layer.cornerRadius = 4
    }
    
    func setupConstraints() {
        categoriesImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoriesImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoriesImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoriesImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoriesImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
