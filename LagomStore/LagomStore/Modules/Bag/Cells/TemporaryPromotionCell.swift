//
//  TemporaryPromotionCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/19/24.
//

import UIKit

class TemporaryPromotionCell: UITableViewCell {
    
    private let containerView = UIView()
    private let label = Label(type: .name)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ model: PromotionModel) {
        label.text = model.label
    }
}

// MARK: - Layout
extension TemporaryPromotionCell {
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(label)
        
        containerView.backgroundColor = .lightGray
        containerView.layer.cornerRadius = 8
        containerView.layer.masksToBounds = true
        
    }
    
    private func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
    
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24)
        ])
    }
}

