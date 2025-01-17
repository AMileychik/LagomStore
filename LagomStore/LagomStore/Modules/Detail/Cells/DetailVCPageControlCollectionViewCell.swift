//
//  DetailVCPageControlCollectionViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/13/24.
//

import UIKit

class DetailVCPageControlCollectionViewCell: UICollectionViewCell {
    
    private let pageControlImageView = ImageView(type: .simple)
    
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
extension DetailVCPageControlCollectionViewCell {
    func updatePageControl(_ model: SubCategoryModel) {
        pageControlImageView.image = UIImage(named: model.image3)
    }
}

// MARK: - Layout
extension DetailVCPageControlCollectionViewCell {
    
    private func setupViews() {
        contentView.addSubview(pageControlImageView)
    }
    
    private func setupConstraints() {

        NSLayoutConstraint.activate([
            pageControlImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            pageControlImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pageControlImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pageControlImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}





