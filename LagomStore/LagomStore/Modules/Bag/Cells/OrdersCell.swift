//
//  Orders.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/17/24.
//

import UIKit

protocol OrdersCellDelegate: AnyObject {
    func didRequestDeleteItem(at indexPath: IndexPath, model: TopPickModel)
}

class OrdersCell: UITableViewCell {
    
    let priceLabel = Label(type: .priceLabel)
    
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
extension OrdersCell {
    func update(_ model: TopPickModel) {
        priceLabel.text = model.price
    }
}

//MARK: - Layout
extension OrdersCell {
    
    func setupViews() {
        contentView.addSubview(priceLabel)
    }
    
    func setupConstraints() {
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 150)
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(equalToConstant: 100)
        heightConstraint.priority = .defaultHigh
        heightConstraint.isActive = true
    }
}

