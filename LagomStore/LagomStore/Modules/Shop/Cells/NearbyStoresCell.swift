//
//  NearbyStoresCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/23/24.
//

import UIKit

enum CellDataType2 {
    case nearbyStoreSectionData(models: [ThankYouModel])
    
    var itemSize: CGSize {
        switch self {
        case .nearbyStoreSectionData:
            return CGSize(width: 275, height: 300)
        }
    }
}

class NearbyStoresCell: UITableViewCell {
    
    private var dataType2: CellDataType2?
    
    private lazy var titleLabel = Label(type: .name)
    private lazy var subtitleLabel = Label(type: .description)
    private let labelStackView = StackView(type: .headerStackView)
    
    
    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        //       button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
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
        collectionView.registerCell(TestCollectionViewCell.self)
        
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
    
    
//MARK: - Public
    func update(_ header: TitleHeaderModel?) {
        titleLabel.text = header?.title
    }
    
    func update(_ model: CellDataType2, sectionHeight: CGFloat) {
        self.dataType2 = model
        if let heightConstraint = collectionView.constraints.first(where: { $0.firstAttribute == .height }) {
            heightConstraint.constant = sectionHeight
            heightConstraint.priority = .defaultHigh
        }
        collectionView.reloadData()
    }
}

//MARK: - CollectionDataSource
extension NearbyStoresCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let dataType2 = dataType2 else { return 0 }
        switch dataType2 {
            
        case .nearbyStoreSectionData(models: let models):
            return models.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let dataType2 = dataType2 else { return UICollectionViewCell() }
        switch dataType2 {
            
        case .nearbyStoreSectionData(models: let models):
            
            let cell = collectionView.dequeuCell(indexPath) as NearbyStoresCollectionViewCell
            let data = models[indexPath.item]
            cell.updateNearbyStoreSection(data)
            
            return cell
        }
    }
}

//MARK: - CollectionDelegate
extension NearbyStoresCell: UICollectionViewDelegate {}

//MARK: - CollectionDelegateFlowLayout
extension NearbyStoresCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return dataType2?.itemSize ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}


//MARK: - Layout
extension NearbyStoresCell {
    
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
            
            collectionView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor),
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
