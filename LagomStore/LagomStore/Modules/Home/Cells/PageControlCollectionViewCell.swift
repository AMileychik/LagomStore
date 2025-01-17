//
//  PageControlCollectionViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/9/24.
//

import UIKit

class PageControlCollectionViewCell: UICollectionViewCell {

    private let pageControlImageView = ImageView(type: .pageControl)
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
        layoutMargins: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8),
        isMarginsRelative: true
    )

    private lazy var containerStackView: UIStackView = createStackView(
        with: [pageControlImageView, labelsStackView],
        axis: .horizontal,
        spacing: 12,
        alignment: .center
    )

    private let backgroundContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray.adjustBrightness(by: 0.150)
        view.layer.cornerRadius = 6
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    private func addLeftCornerRadius(to view: UIView, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        pageControlImageView.layoutIfNeeded()
        addLeftCornerRadius(to: pageControlImageView, radius: 6)
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
 //       backgroundContainerView.addSubview(labelsStackView)

//        containerStackView.layer.borderColor = UIColor.gray.cgColor
//        containerStackView.layer.borderWidth = 0.5
//        containerStackView.clipsToBounds = true
//        containerStackView.layer.cornerRadius = 8

//        pageControlImageView.layer.borderColor = UIColor.gray.cgColor
//        pageControlImageView.layer.borderWidth = 0.5
//        pageControlImageView.clipsToBounds = true
//        pageControlImageView.layer.cornerRadius = 6
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            pageControlImageView.heightAnchor.constraint(equalTo: backgroundContainerView.heightAnchor),

            backgroundContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            backgroundContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            backgroundContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            backgroundContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),

            containerStackView.topAnchor.constraint(equalTo: backgroundContainerView.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: backgroundContainerView.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: backgroundContainerView.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: backgroundContainerView.bottomAnchor)
        ])
    }
    
}



//class PageControlCollectionViewCell: UICollectionViewCell {
//
//    private let pageControlTitleLabel = Label(type: .banner)
//    private let pageControlDescriptionLabel = Label(type: .description)
//
//    private let backgroundContainerView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = UIColor.lightGray.adjustBrightness(by: 0.225)
//        view.layer.cornerRadius = 6
////        view.layer.borderColor = UIColor.gray.cgColor
////        view.layer.borderWidth = 0.5
//        view.clipsToBounds = true
//        return view
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//        setupConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
////MARK: - Public
//extension PageControlCollectionViewCell {
//
//    func updatePageControl(_ model: PageControlModel) {
//        pageControlTitleLabel.text = model.title
//        pageControlDescriptionLabel.text = model.description
//    }
//}
//
//// MARK: - Layout
//extension PageControlCollectionViewCell {
//
//    private func setupViews() {
//
//        contentView.addSubview(backgroundContainerView)
//        backgroundContainerView.addSubview(pageControlTitleLabel)
//        backgroundContainerView.addSubview(pageControlDescriptionLabel)
//    }
//
//    private func setupConstraints() {
//
//        NSLayoutConstraint.activate([
//
//            backgroundContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
//            backgroundContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
//            backgroundContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
//            backgroundContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
//
//            pageControlTitleLabel.topAnchor.constraint(equalTo: backgroundContainerView.topAnchor, constant: 16),
//            pageControlTitleLabel.leadingAnchor.constraint(equalTo: backgroundContainerView.leadingAnchor, constant: 16),
//            pageControlTitleLabel.trailingAnchor.constraint(equalTo: backgroundContainerView.trailingAnchor, constant: -16),
//
//            pageControlDescriptionLabel.topAnchor.constraint(equalTo: pageControlTitleLabel.bottomAnchor, constant: 10),
//            pageControlDescriptionLabel.leadingAnchor.constraint(equalTo: pageControlTitleLabel.leadingAnchor),
//            pageControlDescriptionLabel.trailingAnchor.constraint(equalTo: pageControlTitleLabel.trailingAnchor)
//        ])
//    }
//}
