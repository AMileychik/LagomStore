//
//  FavoriteCollectionViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/11/24.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
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
        contentView.addSubview(deleteButton)
        
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.masksToBounds = true // Обрезка содержимого по границам
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            deleteButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 4),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            deleteButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    @objc private func deleteButtonTapped() {
        onDelete?()
    }
}















//class FavoriteCollectionViewCell: UICollectionViewCell {
//    
//    private let containerView = UIView()
//
//
//    private let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        return imageView
//    }()
//
//    private let deleteButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Delete", for: .normal)
//        button.setTitleColor(.red, for: .normal)
//        button.backgroundColor = .clear
//        button.isHidden = true
//        return button
//    }()
//
//    var onDelete: (() -> Void)?
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func update(_ model: TopPickModel, isEdining: Bool) {
//        imageView.image = UIImage(named: model.image)
//        deleteButton.isHidden = !isEdining
//    }
//    
//
//    private func setupView() {
//        contentView.addSubview(imageView)
////        contentView.addSubview(deleteButton)
//        
//
//        
//        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
//        
////        contentView.layer.borderWidth = 1
////        contentView.layer.borderColor = UIColor.black.cgColor
////        contentView.layer.masksToBounds = true // Обрезка содержимого по границам
//
//        NSLayoutConstraint.activate([
//  
//            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
// //           imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            imageView.heightAnchor.constraint(equalToConstant: 200)
//
////            deleteButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 4),
////            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
////            deleteButton.heightAnchor.constraint(equalToConstant: 30)
//        ])
//    }
//
//    @objc private func deleteButtonTapped() {
//        onDelete?()
//    }
//}





//class FavoriteCollectionViewCell: UICollectionViewCell {
//    
//    static let identifier = "FavoriteCollectionViewCell"
//    
//    private let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill // Масштабирование с сохранением пропорций
//        imageView.clipsToBounds = true // Обрезка изображения по границам
//        return imageView
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func configure(with model: TopPickModel) {
//        imageView.image = UIImage(named: model.image)
//    }
//    
//    private func setupView() {
//        contentView.addSubview(imageView)
//
//        contentView.layer.borderWidth = 1
//        contentView.layer.borderColor = UIColor.black.cgColor
//        contentView.layer.masksToBounds = true // Обрезка содержимого по границам
//
//        NSLayoutConstraint.activate([
//            // ImageView
//            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//        ])
//    }
//}
//
//
