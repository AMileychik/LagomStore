//
//  DetailButtons.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/12/24.
//

import UIKit

class DetailButtons: UITableViewCell {
    
    var currentModel: TopPickModel?
    var orderService2: OrdersServiceProtocol = OrdersService()
    
    var addToBagButton = UIButton()
    var favoriteButton = UIButton()
    
    var onAddToBagButton: (() -> Void)?
    var onFavoriteButton: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton(_ button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        onFavoriteButton?()
        print("Post")
    }
    
    //    override func prepareForReuse() {
    //        super.prepareForReuse()
    //        onAddToBagButton = nil
    //        onFavoriteButton = nil
    //    }
}

// MARK: - Public
extension DetailButtons {
    func update(_ model: DetailButtonsModel, topPickModel: TopPickModel) {
        addToBagButton.setTitle(model.firstButtonTitle, for: .normal)
        favoriteButton.setTitle(model.seconrButtonTitle, for: .normal)
        currentModel = topPickModel
    }
}

//MARK: - Layout
extension DetailButtons {
    
    private func setupViews() {
        [addToBagButton, favoriteButton].forEach {
            contentView.addSubview($0)
        }
        configureButton(addToBagButton)
        configureButton(favoriteButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            addToBagButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            addToBagButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            addToBagButton.heightAnchor.constraint(equalToConstant: 50),
            addToBagButton.widthAnchor.constraint(equalToConstant: 325),
            
            favoriteButton.topAnchor.constraint(equalTo: addToBagButton.bottomAnchor, constant: 16),
            favoriteButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            favoriteButton.heightAnchor.constraint(equalToConstant: 50),
            favoriteButton.widthAnchor.constraint(equalToConstant: 325)
        ])
    }
}


    

 
    


