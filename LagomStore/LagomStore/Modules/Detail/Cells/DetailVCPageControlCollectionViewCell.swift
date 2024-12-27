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
        setupPageControlViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPageControlViews() {
        
        contentView.addSubview(pageControlImageView)
        
        pageControlImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageControlImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            pageControlImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pageControlImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pageControlImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func updatePageControl(_ model: SubCategoryModel) {
        pageControlImageView.image = UIImage(named: model.image3)
    }
}





