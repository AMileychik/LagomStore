//
//  NewAndFeaturedCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/27/24.
//

import UIKit

class NewAndFeaturedCell: UITableViewCell {
    
//    var rowHeights: [CGFloat] = []
   
    private var newAndFeaturedData: [TopPickModel] = []
    private var collectionViewHeightConstraint: NSLayoutConstraint?

    private lazy var titleLabel = Label(type: .name)
    private let descriptionLabel = Label(type: .description)
    private let labelStackView = StackView(type: .productCell)
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
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
        collectionView.registerCell(NewAndFeaturedCellCollectionViewCell.self)
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureHeader(with header: TitleHeaderModel?) {
        titleLabel.text = header?.title
//        subtitleLabel.text = header?.subtitleLabel
//        actionButton.setTitle(header?.buttonTitle, for: .normal)
//        headerStackView.isHidden = header == nil
    }
    
    func updateNewAndFeaturedSection(_ model: [TopPickModel], heights: CGFloat) {
        newAndFeaturedData = model
//        rowHeights = heights
        updateCollectionViewHeight(heights)
        collectionView.reloadData()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newAndFeaturedData.removeAll()
//        rowHeights.removeAll()
        updateCollectionViewHeight(0)
    }
    
    func updateCollectionViewHeight(_ height: CGFloat) {
        collectionViewHeightConstraint?.constant = height
    }
}

extension NewAndFeaturedCell: UICollectionViewDelegate {}

extension NewAndFeaturedCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newAndFeaturedData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeuCell(indexPath) as NewAndFeaturedCellCollectionViewCell
        let data = newAndFeaturedData[indexPath.item]
        cell.updateNewAndFeaturedSection(data)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return rowHeights[indexPath.row]
//    }
}


extension NewAndFeaturedCell: UICollectionViewDelegateFlowLayout {
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


// MARK: - Layout
extension NewAndFeaturedCell {

    func setupView() {
        contentView.addSubview(labelStackView)
        contentView.addSubview(collectionView)
        labelStackView.addArrangedSubview(titleLabel)
    }
    
    func setupConstraints() {
        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 0)
        collectionViewHeightConstraint?.isActive = true
        
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            labelStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            collectionView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}







