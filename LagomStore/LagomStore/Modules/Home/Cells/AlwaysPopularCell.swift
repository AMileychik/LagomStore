//
//  AlwaysPopularCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/9/24.
//

import UIKit

class AlwaysPopularCell: UITableViewCell {
    
    private let largeImageView    = ImageView(type: .alwaysPopular)
    private let smallImageView1   = ImageView(type: .alwaysPopular)
    private let smallImageView2   = ImageView(type: .alwaysPopular)
    
    private let titleLabel        = Label(type: .alwaysPopular)
    private let largeImageLabel1  = Label(type: .alwaysPopular)
    private let largeImageLabel2  = Label(type: .alwaysPopular)
    private let smallImage1Label1 = Label(type: .alwaysPopular)
    private let smallImage1Label2 = Label(type: .alwaysPopular)
    private let smallImage2Label1 = Label(type: .alwaysPopular)
    private let smallImage2Label2 = Label(type: .alwaysPopular)
    
    private lazy var rightButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleRightButtonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var bottomButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleBottomButtonTap), for: .touchUpInside)
        button.clipsToBounds = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    var largeImageTapped:   (() -> Void)?
    var smallImage1Tapped:  (() -> Void)?
    var smallImage2Tapped:  (() -> Void)?
    var rightButtonTapped:  (() -> Void)?
    var bottomButtonTapped: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleRightButtonTap() {
        rightButtonTapped?()
        print("rightButtonTapped")
    }
    
    @objc private func handleBottomButtonTap() {
        bottomButtonTapped?()
        print("handleBottomButtonTap")
    }
}

//MARK: - Public
extension AlwaysPopularCell {
    func update(_ model: AlwaysPopularModel) {
        titleLabel.text = model.title
        rightButton.setTitle(model.rightButtonTitle, for: .normal)
        
        largeImageView.image = UIImage(named: model.largeImage)
        smallImageView1.image = UIImage(named: model.smallImage1)
        smallImageView2.image = UIImage(named: model.smallImage2)
        
        largeImageLabel1.text = model.largeImageLabel1
        largeImageLabel2.text = model.largeImageLabel2
        
        smallImage1Label1.text = model.smallImage1Label1
        smallImage1Label2.text = model.smallImage1Label2
        
        smallImage2Label1.text = model.smallImage2Label1
        smallImage2Label2.text = model.smallImage2Label2
        
        bottomButton.setTitle(model.bottomButtonTitle, for: .normal)
    }
}

// MARK: - Layout
extension AlwaysPopularCell {
    
    private func setupViews() {
        contentView.backgroundColor = .black
        
        [largeImageView, smallImageView1, smallImageView2, titleLabel, rightButton, bottomButton,
         largeImageLabel1, largeImageLabel2, smallImage1Label1, smallImage1Label2, smallImage2Label1, smallImage2Label2].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Заголовок и кнопка
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            rightButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            rightButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            // Большое изображение
            largeImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            largeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            largeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            largeImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.0),
            
            // Лейблы под большим изображением
            largeImageLabel1.topAnchor.constraint(equalTo: largeImageView.bottomAnchor, constant: 8),
            largeImageLabel1.leadingAnchor.constraint(equalTo: largeImageView.leadingAnchor),
            largeImageLabel1.trailingAnchor.constraint(equalTo: largeImageView.trailingAnchor),
            
            largeImageLabel2.topAnchor.constraint(equalTo: largeImageLabel1.bottomAnchor, constant: 4),
            largeImageLabel2.leadingAnchor.constraint(equalTo: largeImageLabel1.leadingAnchor),
            largeImageLabel2.trailingAnchor.constraint(equalTo: largeImageView.trailingAnchor),
            
            // Маленькие изображения
            smallImageView1.topAnchor.constraint(equalTo: largeImageLabel2.bottomAnchor, constant: 16),
            smallImageView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            smallImageView1.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.440),
            smallImageView1.heightAnchor.constraint(equalTo: smallImageView1.widthAnchor),
            
            smallImageView2.topAnchor.constraint(equalTo: largeImageLabel2.bottomAnchor, constant: 16),
            smallImageView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            smallImageView2.widthAnchor.constraint(equalTo: smallImageView1.widthAnchor),
            smallImageView2.heightAnchor.constraint(equalTo: smallImageView1.heightAnchor),
            
            // Лейблы под маленькими изображениями
            smallImage1Label1.topAnchor.constraint(equalTo: smallImageView1.bottomAnchor, constant: 8),
            smallImage1Label1.leadingAnchor.constraint(equalTo: smallImageView1.leadingAnchor),
            smallImage1Label1.trailingAnchor.constraint(equalTo: smallImageView1.trailingAnchor),
            
            smallImage1Label2.topAnchor.constraint(equalTo: smallImage1Label1.bottomAnchor, constant: 4),
            smallImage1Label2.leadingAnchor.constraint(equalTo: smallImage1Label1.leadingAnchor),
            smallImage1Label2.trailingAnchor.constraint(equalTo: smallImageView1.trailingAnchor),
            
            smallImage2Label1.topAnchor.constraint(equalTo: smallImageView2.bottomAnchor, constant: 8),
            smallImage2Label1.leadingAnchor.constraint(equalTo: smallImageView2.leadingAnchor),
            smallImage2Label1.trailingAnchor.constraint(equalTo: smallImageView2.trailingAnchor),
            
            smallImage2Label2.topAnchor.constraint(equalTo: smallImage2Label1.bottomAnchor, constant: 4),
            smallImage2Label2.leadingAnchor.constraint(equalTo: smallImage2Label1.leadingAnchor),
            smallImage2Label2.trailingAnchor.constraint(equalTo: smallImageView2.trailingAnchor),
            
            // Нижняя кнопка
            bottomButton.topAnchor.constraint(equalTo: smallImage1Label2.bottomAnchor, constant: 24),
            bottomButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bottomButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            bottomButton.heightAnchor.constraint(equalToConstant: 50),
            bottomButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }
}
