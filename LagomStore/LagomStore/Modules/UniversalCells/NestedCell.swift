//
//  NestedCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/9/24.
//

import UIKit

class NestedCell: UITableViewCell {
    
    private let nestedCellImageView = ImageView(type: .simple)
    private var gradientView: GradientView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientView?.frame = contentView.bounds
    }
}

//MARK: - Public
extension NestedCell {
    func updateHomeListCell(with model: ListModel, addGradient: Bool) {
        nestedCellImageView.image = UIImage(named: model.image ?? "")
        
        if addGradient {
            if gradientView == nil {
                let gradient = GradientView()
                contentView.insertSubview(gradient, aboveSubview: nestedCellImageView)
                self.gradientView = gradient
            }
            gradientView?.isHidden = false
        } else {
            gradientView?.isHidden = true
        }
    }
    
    func updateShopListCell(with model: ThankYouModel) {
        nestedCellImageView.image = UIImage(named: model.image)
    }
}

// MARK: - Layout
extension NestedCell {
    
    func setupView() {
        contentView.addSubview(nestedCellImageView)
    }
    
    func setupConstraints() {
        nestedCellImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nestedCellImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            nestedCellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nestedCellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nestedCellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])
    }
}


