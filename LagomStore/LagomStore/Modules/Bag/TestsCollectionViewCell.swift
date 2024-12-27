//
//  TestsCollectionViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/20/24.
//

import UIKit

class TestsCollectionViewCell: UICollectionViewCell {
   
    private let containerView = UIView()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .clear
        button.isHidden = true
        return button
    }()

    var onDelete: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    func update(_ model: TopPickModel, isEdining: Bool) {
        imageView.image = UIImage(named: model.image)
        deleteButton.isHidden = !isEdining
    }
    

    private func setupView() {
        contentView.addSubview(imageView)
//        contentView.addSubview(deleteButton)
        
//        contentView.addSubview(containerView)
//        containerView.addSubview(imageView)
//
//        containerView.backgroundColor = .lightGray
//        containerView.layer.cornerRadius = 8
//        containerView.layer.masksToBounds = true
        
        
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.masksToBounds = true // Обрезка содержимого по границам
        
//        containerView.backgroundColor = .green
        
//        containerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
//            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
//            imageView.widthAnchor.constraint(equalToConstant: 200),
//            imageView.heightAnchor.constraint(equalToConstant: 200)

//            deleteButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 4),
//            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
//            deleteButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    @objc private func deleteButtonTapped() {
        onDelete?()
    }
}
