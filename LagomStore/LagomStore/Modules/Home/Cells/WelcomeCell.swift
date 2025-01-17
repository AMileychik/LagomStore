//
//  WelcomeCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 9/27/24.
//

import UIKit

class WelcomeCell: UITableViewCell {
    
    private let welcomeLabel = Label(type: .name)
    
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
extension WelcomeCell {
    func update(_ text: String) {
        welcomeLabel.text = text
    }
}

//MARK: - Layout
extension WelcomeCell {
    
    func setupViews() {
        contentView.addSubview(welcomeLabel)
        
//        contentView.layer.borderColor = UIColor.blue.cgColor
//        contentView.layer.borderWidth = 1
//        contentView.clipsToBounds = true
//        contentView.layer.cornerRadius = 4
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            welcomeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            welcomeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            welcomeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
