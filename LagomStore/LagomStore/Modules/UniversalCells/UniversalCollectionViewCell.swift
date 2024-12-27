//
//  ThisWeekTopStoriesCollectionViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/20/24.
//

import UIKit

enum DataType {
    case topPicks(models: [TopPickModel])
    case thisWeekTopStories(models: [TopPickModel])
    case productCategory2(models: [TopPickModel])
}

// Конфигурация для ячейки
struct CollectionViewCellConfig {
    let imageType: ImageViewType2
    let nameLabel: LabelType2
    let descriptionLabel: LabelType2
    let priceLabel: LabelType2
    let image: String?
    let nameText: String?
    let descriptionText: String?
    let priceText: String?
    let stackViewType: StackViewType
}

class UniversalCollectionViewCell: UICollectionViewCell {
    
    private var dataType: DataType?
    private let nameLabel = Label2()
    private let descriptionLabel = Label2()
    private let priceLabel = Label2()
    private let photoImageView = ImageView2()
    private let horizontalStackView = UIStackView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    override func prepareForReuse() {
    //        super.prepareForReuse()
    //        nameLabel.text = nil
    //        descriptionLabel.text = nil
    //        photoImageView.image = nil
    //    }
    
}

//MARK: - Public
extension UniversalCollectionViewCell {
    func update(section: DataType) {
        self.dataType = section
        update(with: configureForModel(section: dataType!))
    }
    
    private func update(with config: CollectionViewCellConfig) {
        photoImageView.configure(type: config.imageType)
        if let image = UIImage(named: config.image ?? "") {
            photoImageView.image = image
        }
        nameLabel.configure(type: config.nameLabel)
        descriptionLabel.configure(type: config.descriptionLabel)
        priceLabel.configure(type: config.priceLabel)
        
        nameLabel.text = config.nameText
        descriptionLabel.text = config.descriptionText
        priceLabel.text = config.priceText
    }
    
    private func configureForModel(section: DataType) -> CollectionViewCellConfig {
        switch section {
            
        case .topPicks(models: let model):
            return CollectionViewCellConfig(
                imageType: .product,
                nameLabel: .name,
                descriptionLabel: .description,
                priceLabel: .subtitle,
                image: model.first?.image,
                nameText: model.first?.type,
                descriptionText: model.first?.description,
                priceText: model.first?.price,
                stackViewType: .headerStackView
            )
            
        case .thisWeekTopStories(models: let model):
            return CollectionViewCellConfig(
                imageType: .thisWeekTopStories,
                nameLabel: .description,
                descriptionLabel: .description,
                priceLabel: .subtitle,
                image: model.first?.image,
                nameText: model.first?.type,
                descriptionText: model.first?.description,
                priceText: model.first?.description,
                stackViewType: .headerStackView
            )
            
        case .productCategory2(models: let model):
            return CollectionViewCellConfig(
                imageType: .banner,
                nameLabel: .name,
                descriptionLabel: .description,
                priceLabel: .subtitle,
                image: model.first?.image,
                nameText: model.first?.type,
                descriptionText: model.first?.description,
                priceText: model.first?.price,
                stackViewType: .headerStackView
            )
        }
    }
}

// MARK: - Layout
extension UniversalCollectionViewCell {
    
    private func setupViews() {
        backgroundColor = .systemBackground
        horizontalStackView.axis = .vertical
        horizontalStackView.spacing = 8
        
        contentView.addSubview(photoImageView)
        contentView.addSubview(horizontalStackView)
        
        horizontalStackView.addArrangedSubview(nameLabel)
        horizontalStackView.addArrangedSubview(descriptionLabel)
        horizontalStackView.addArrangedSubview(priceLabel)
    }
    
    private func setupConstraints() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //        let heightConstraint = photoImageView.heightAnchor.constraint(equalToConstant: 100)
        //        heightConstraint.priority = .defaultHigh
        //        heightConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            horizontalStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 8),
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
    }
}





