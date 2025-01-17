//
//  TestCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/26/24.
//

import UIKit

class RecentlyViewedCell: UITableViewCell {
    
    private var recentlyViewedData: [TopPickModel] = []
    
    private lazy var titleLabel = Label(type: .name)
    private lazy var subtitleLabel = Label(type: .banner)
    private let labelStackView = StackView(type: .headerStackView)

    var onRemoveSection: (() -> Void)?
    
    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func buttonTapped() {
        onRemoveSection?()
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.registerCell(TestCollectionViewCell.self)
        collectionView.registerCell(CategoriesCollectionViewCell.self)
        collectionView.registerCell(UniversalCollectionViewCell.self)
        collectionView.registerCell(NearbyStoresCollectionViewCell.self)
        collectionView.registerCell(RecentlyViewedCollectionViewCell.self)
        collectionView.registerCell(NewAndFeaturedCellCollectionViewCell.self)
        
        return collectionView
    }()
    
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
extension RecentlyViewedCell {
    
    func update(_ header: TitleHeaderModel?) {
        titleLabel.text = header?.title
        subtitleLabel.text = header?.subtitleLabel
        actionButton.setTitle(header?.buttonTitle, for: .normal)
    }
    
    func update(_ model: [TopPickModel], sectionHeight: CGFloat) {
        self.recentlyViewedData = model
        if let heightConstraint = collectionView.constraints.first(where: { $0.firstAttribute == .height }) {
            heightConstraint.constant = sectionHeight
            heightConstraint.priority = .defaultHigh
        }
        collectionView.reloadData()
    }
}

//MARK: - CollectionDataSource
extension RecentlyViewedCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recentlyViewedData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeuCell(indexPath) as RecentlyViewedCollectionViewCell
        
        let data = recentlyViewedData[indexPath.item]
        cell.updateRecentlyViewed(data)
        
        return cell
    }
}

//MARK: - CollectionDelegate
extension RecentlyViewedCell: UICollectionViewDelegate {}

//MARK: - CollectionDelegateFlowLayout
extension RecentlyViewedCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 225)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}

//MARK: - Layout
extension RecentlyViewedCell {
    
    private func setupViews() {
        contentView.addSubview(labelStackView)
        contentView.addSubview(actionButton)
        contentView.addSubview(collectionView)
        
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(subtitleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            labelStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            collectionView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            collectionView.heightAnchor.constraint(equalToConstant: 0),
            
            actionButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            actionButton.widthAnchor.constraint(equalToConstant: 75),
            actionButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}
