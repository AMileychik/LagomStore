//
//  PageControlCollectionViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/9/24.
//

import UIKit

class PageControlCollectionViewCell: UICollectionViewCell {
    
    private let backgroundContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let pageControlImageView = ImageView(type: .banner)
    private let pageControlTitleLabel = Label(type: .banner)
    private let pageControlDescriptionLabel = Label(type: .description)
    //    private lazy var labelsStackView = StackView2(type2: .homePageControlSection, with: [pageControlTitleLabel, pageControlDescriptionLabel])
    
    
    private func createStackView(with views: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, alignment: UIStackView.Alignment = .fill, layoutMargins: UIEdgeInsets = .zero, isMarginsRelative: Bool = false) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.isLayoutMarginsRelativeArrangement = isMarginsRelative
        if isMarginsRelative {
            stackView.layoutMargins = layoutMargins
        }
        return stackView
    }
    
    private lazy var labelsStackView: UIStackView = createStackView(
        with: [pageControlTitleLabel, pageControlDescriptionLabel],
        axis: .vertical,
        spacing: 4,
        alignment: .leading,
        layoutMargins: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 32),
        isMarginsRelative: true
    )
    
    private lazy var containerStackView: UIStackView = createStackView(
        with: [pageControlImageView, labelsStackView],
        axis: .horizontal,
        spacing: 12,
        alignment: .center
    )
    
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
extension PageControlCollectionViewCell {
    
    func updatePageControl(_ model: PageControlModel) {
        pageControlImageView.image = UIImage(named: model.image)
        pageControlTitleLabel.text = model.title
        pageControlDescriptionLabel.text = model.description
    }
}

// MARK: - Layout
extension PageControlCollectionViewCell {
    
    private func setupViews() {
        
        contentView.addSubview(backgroundContainerView)
        backgroundContainerView.addSubview(containerStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            backgroundContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            backgroundContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            backgroundContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            containerStackView.topAnchor.constraint(equalTo: backgroundContainerView.topAnchor, constant: 8),
            containerStackView.leadingAnchor.constraint(equalTo: backgroundContainerView.leadingAnchor, constant: 8),
            containerStackView.trailingAnchor.constraint(equalTo: backgroundContainerView.trailingAnchor, constant: -8),
            containerStackView.bottomAnchor.constraint(equalTo: backgroundContainerView.bottomAnchor, constant: -8),
        ])
    }
}




