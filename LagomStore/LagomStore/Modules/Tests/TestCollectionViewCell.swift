//
//  HorizontalCurvedCornerCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 9/30/24.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    
    private let photoImageView = ImageView(type: .banner)
    private let nameLabel = Label(type: .description)
    private let descriptionLabel = Label(type: .description)
    private let priceLabel = Label(type: .description)
    
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
extension TestCollectionViewCell {
    func updateShoes(_ model: Categories) {
        //        print("->", model)
        //        print("img ->",model.image)
        //        print(Thread.current)
        
//        photoImageView.image = UIImage(named: model.image2)
    }
    
    func updateTopPicks(_ model: TopPickModel) {
        //        print("->", model)
        //        print("img ->",model.image)
        //        print(Thread.current)
        
        photoImageView.image = UIImage(named: model.image)
        nameLabel.text = model.description
        descriptionLabel.text = model.type
        priceLabel.text = model.price
    }
    
    func updateSecondCollection(_ model: TopPickModel) {
//        photoImageView.image = UIImage(named: model.image)
//        nameLabel.text = model.description
//        descriptionLabel.text = model.type
//        priceLabel.text = model.price
    }
    

}

//MARK: - Layout
extension TestCollectionViewCell {
    
    func setupViews() {
        backgroundColor = .systemBackground
        contentView.addSubview(photoImageView)
        contentView.addSubview(horizontalStackView)
        
        horizontalStackView.addArrangedSubview(nameLabel)
        horizontalStackView.addArrangedSubview(descriptionLabel)
        horizontalStackView.addArrangedSubview(priceLabel)
    }
    
    func setupConstraints() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            photoImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            horizontalStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}








//class TopPicksCollectionViewCell: UICollectionViewCell {
//    
//    private let topPicksImageView = ImageView(type: .product)
//    
////    private let topPicksImageView: UIImageView = {
////        let imageView = UIImageView()
////        imageView.translatesAutoresizingMaskIntoConstraints = false
////        imageView.contentMode = .scaleAspectFill
////        imageView.clipsToBounds = true
////        imageView.layer.cornerRadius = 12
////        return imageView
////    }()
//    
//    private let topPicksTitleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 16)
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private let topPicksDescriptionLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 16)
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private let topPicksPriceLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 16)
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupTopPicksViews()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupTopPicksViews()
//    }
//    
//    func setupTopPicksViews() {
//        contentView.addSubview(topPicksImageView)
//        contentView.addSubview(topPicksTitleLabel)
//        contentView.addSubview(topPicksDescriptionLabel)
//        contentView.addSubview(topPicksPriceLabel)
//        
//        topPicksImageView.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            
//            topPicksImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            topPicksImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            
//            topPicksTitleLabel.topAnchor.constraint(equalTo: topPicksImageView.bottomAnchor, constant: 6),
//            topPicksTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            topPicksTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            
//            topPicksDescriptionLabel.topAnchor.constraint(equalTo: topPicksTitleLabel.bottomAnchor, constant: 6),
//            topPicksDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            topPicksDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            
//            topPicksPriceLabel.topAnchor.constraint(equalTo: topPicksDescriptionLabel.bottomAnchor, constant: 6),
//            topPicksPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            topPicksPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//        ])
//    }
//    
//    func updateShoes(_ model: Categories) {
//        //        print("->", model)
//        //        print("img ->",model.image)
//        //        print(Thread.current)
//        
//        topPicksImageView.image = UIImage(named: model.image2)
//    }
//    
//    func updateTopPicks(_ model: TopPickModel) {
//        //        print("->", model)
//        //        print("img ->",model.image)
//        //        print(Thread.current)
//        
//        topPicksImageView.image = UIImage(named: model.image)
//        topPicksTitleLabel.text = model.description
//        topPicksDescriptionLabel.text = model.type
//        topPicksPriceLabel.text = model.price
//    }
//
//    func updateSecondCollection(_ model: TopPickModel) {
//        topPicksImageView.image = UIImage(named: model.image)
//        topPicksTitleLabel.text = model.description
//        topPicksDescriptionLabel.text = model.type
//        topPicksPriceLabel.text = model.price
//        topPicksImageView.image = UIImage(named: model.image)
//    }
//    
//    func updateThisWeekTopStories(_ model: TopPickModel) {
//        topPicksImageView.image = UIImage(named: model.image)
////        topPicksTitleLabel.text = model.description
////        topPicksDescriptionLabel.text = model.type
//    }
//}
//
//
