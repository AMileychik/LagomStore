//
//  FavoriteCollectionViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/11/24.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    private let imageView = ImageView(type: .simple)
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .clear
        button.isHidden = true
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var onDelete: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func deleteButtonTapped() {
        onDelete?()
    }
}

//MARK: - Public
extension FavoriteCollectionViewCell {
    func update(_ model: TopPickModel, isEdining: Bool) {
        imageView.image = UIImage(named: model.image)
        deleteButton.isHidden = !isEdining
    }
}

//MARK: - Layout
extension FavoriteCollectionViewCell {
   
    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(deleteButton)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.masksToBounds = true // Обрезка содержимого по границам
    }
    
    private func setupConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            deleteButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 4),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            deleteButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}







