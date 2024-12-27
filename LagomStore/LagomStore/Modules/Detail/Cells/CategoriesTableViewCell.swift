//
//  TableViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/3/24.
//

import UIKit

protocol TableViewCellDelegate: AnyObject {
    func didSelectItem(with model: [SubCategoryModel], subCategory: String)
}

class CategoriesTableViewCell: UITableViewCell {
    
    weak var delegate: TableViewCellDelegate?
    
    private var categories: [Categories] = []
    private var subCategory: [SubCategoryModel] = []
    
//    weak var viewcontroller: UIViewController?
    
    private lazy var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerCell(CategoriesCollectionViewCell.self)
        
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
    
    private func setupViews() {
        contentView.addSubview(categoriesCollectionView)
    }
    
    func setupConstraints() {
        categoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoriesCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 125),
        ])
    }
    
    func updateCategories(_ model: [Categories]) {
        self.categories = model
        self.subCategory = model.first?.subCategories ?? []
        //        self.subCategory = model[0].subCategories
        categoriesCollectionView.reloadData()
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        
//        // Сброс данных
//        categories = []
//        subCategory = []
//        
//        // Перезагрузка коллекции
//        categoriesCollectionView.reloadData()
//        
//        // Сброс делегата, если требуется
//        delegate = nil
//    }
}

extension CategoriesTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedSubCategory = categories[indexPath.item].subCategories
        let subCategoryName = categories[indexPath.item].subCategories.first?.currentSubCategory ?? ""
        
        delegate?.didSelectItem(with: selectedSubCategory, subCategory: subCategoryName)
    }
}

extension CategoriesTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeuCell(indexPath) as CategoriesCollectionViewCell
        let data = categories[indexPath.item]
        cell.updateCategories(data)
        
        return cell
    }
}

extension CategoriesTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    // Отступы между строками ячеек (по вертикали)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
    //     Отступы между элементами в строке (по горизонтали)
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 6
//    }
    
    // Отступы от края коллекции
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
    }
}






