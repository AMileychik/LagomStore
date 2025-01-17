//
//  TestsCollectionViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/20/24.
//

import UIKit

class TestsCollectionViewCell: UICollectionViewCell {
            
   private let imageView = ImageView(type: .simple)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public
extension TestsCollectionViewCell {
    func update(_ model: TopPickModel, isEdining: Bool) {
        imageView.image = UIImage(named: model.image)
    }
}

// MARK: - Layout
extension TestsCollectionViewCell {
    
    private func setupView() {
        contentView.addSubview(imageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
