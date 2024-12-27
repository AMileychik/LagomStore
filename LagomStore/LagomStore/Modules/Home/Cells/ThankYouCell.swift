//
//  ThankYouCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/2/24.
//

import UIKit

class ThankYouCell: UITableViewCell {
    
    private let photo = ImageView(type: .thankYou)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Public
extension ThankYouCell {
    func update(_ model: ThankYouModel) {
        photo.image = UIImage(named: model.image)
    }
}

// MARK: - Layout
extension ThankYouCell {
    
    private func setupViews() {
        contentView.addSubview(photo)
    }
    
    private func setupConstraints() {
        
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}


