//
//  FavoriteVCTableViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/13/24.
//

import UIKit

class FavoriteVCTableViewCell: UITableViewCell {
    
    private var data: [TopPickModel] = []
    var orderService: OrdersServiceProtocol = OrdersService()
    private var isEditingMode: Bool = false

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.registerCell(FavoriteCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false // Высота зависит от контента
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Public
extension FavoriteVCTableViewCell {
    
    func update(_ model: [TopPickModel], isEditing: Bool = false) {
        self.data = model
        self.isEditingMode = isEditing
        updateCollectionViewHeight()
        collectionView.reloadData()
    }
    
    func updateCollectionViewHeight() {
        let rows = ceil(Double(data.count) / 2.0) // Количество строк
        let itemHeight = (UIScreen.main.bounds.width - (3 * 8)) / 2
        let totalHeight = rows * Double(itemHeight) + (rows - 1) * 8 + 16

        if let heightConstraint = collectionView.constraints.first(where: { $0.firstAttribute == .height }) {
            heightConstraint.constant = totalHeight
        } else {
            let heightConstraint = collectionView.heightAnchor.constraint(equalToConstant: totalHeight)
            heightConstraint.priority = .defaultHigh
            heightConstraint.isActive = true
        }
    }
}

//MARK: - CollectionViewDataSource
extension FavoriteVCTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeuCell(indexPath) as FavoriteCollectionViewCell
        let model = data[indexPath.item]
    
        cell.update(model, isEdining: isEditingMode)    
        
        cell.onDelete = {
            let updatedData = self.orderService.delete(model)
            self.data = updatedData
//            self.collectionView.reloadData()
        }
        return cell
    }
}

// MARK: - CollectionViewDelegate
extension FavoriteVCTableViewCell: UICollectionViewDelegate {}

// MARK: - CollectionViewDelegateFlowLayout
extension FavoriteVCTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let totalSpacing = (3 * 8) // Отступы: 2 ячейки и края секции
        let width = (Int(collectionView.bounds.width) - totalSpacing) / 2 // Ширина ячейки
        return CGSize(width: width, height: width) // Высота = ширина для квадратной ячейки
    }
}

// MARK: - Layout
extension FavoriteVCTableViewCell {
    
    private func setupView() {
        contentView.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}














