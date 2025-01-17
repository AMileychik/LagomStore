//
//  TopPicksCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 1/13/25.
//

import UIKit

protocol TopPicksContainerCellDelegate: AnyObject {
    func didSelectItem(_ model: [TopPickModel], category: String)
}

class TopPicksContainerCell: UITableViewCell {
    
    private var topPicksData: [TopPickModel] = []
    weak var delegete: TopPicksContainerCellDelegate?
    
    private let headerTitleLabel = Label(type: .name)
    private let headerDescriptionLabel = Label(type: .description)
    private let headerStackView = StackView(type: .headerStackView)
    
    var onHeaderButtonTapped: (() -> Void)?
    
    private lazy var headerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(headerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.registerCell(TopPicksCollectionCell.self)
        
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
    
    @objc func headerButtonTapped() {
        onHeaderButtonTapped?()
        print("Tapped")
    }
}

//MARK: - Public {
extension TopPicksContainerCell {
    
    func updateHeader(_ model: UniversalHeaderModel) {
        headerTitleLabel.text = model.firstLabelText
        headerDescriptionLabel.text = model.subtitleLabel
        headerButton.setTitle(model.buttonTitle, for: .normal)
    }
    
    func update(_ model: [TopPickModel]) {
        self.topPicksData = model
        collectionView.reloadData()
    }
}

// MARK: - CollectionViewDataSource
extension TopPicksContainerCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topPicksData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeuCell(indexPath) as TopPicksCollectionCell
        let data = topPicksData[indexPath.item]
        cell.update(data)
        return cell
    }
}

//MARK: - CollectionViewDelegate
extension TopPicksContainerCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = topPicksData[indexPath.item]
        let category = model.categoryName ?? ""
        delegete?.didSelectItem([model], category: category)
    }
}

//MARK: - CollectionViewDelegateFlowLayout
extension TopPicksContainerCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150.00, height: 280.00)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}

//MARK: - Layout
extension TopPicksContainerCell {
    
    private func setupViews() {
        contentView.addSubview(collectionView)
        contentView.addSubview(headerStackView)
        contentView.addSubview(headerButton)
        
        headerStackView.addArrangedSubview(headerTitleLabel)
        headerStackView.addArrangedSubview(headerDescriptionLabel)
        
//        contentView.layer.borderColor = UIColor.blue.cgColor
//        contentView.layer.borderWidth = 1
//        contentView.clipsToBounds = true
//        contentView.layer.cornerRadius = 4
//        
//        collectionView.layer.borderColor = UIColor.red.cgColor
//        collectionView.layer.borderWidth = 1
//        collectionView.clipsToBounds = true
//        collectionView.layer.cornerRadius = 4
    }
    
    private func setupConstraints() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        headerButton.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 300)
        heightConstraint.priority = .defaultHigh
        heightConstraint.isActive = true

        NSLayoutConstraint.activate([
            
            headerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            headerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            headerButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            headerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            headerButton.widthAnchor.constraint(equalToConstant: 75),
            headerButton.heightAnchor.constraint(equalToConstant: 35),
            
            collectionView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 4),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
