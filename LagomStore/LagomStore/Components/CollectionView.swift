//
//  CollectionView.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/25/24.
//

//import UIKit
//
//enum CollectionViewType {
//    case horizontal
//    case vertical
//    case grid(columns: Int)
//}
//
//class CustomCollectionView: UICollectionView {
//    
//    init(type: CollectionViewType) {
//        let layout = UICollectionViewFlowLayout()
//        
//        switch type {
//        case .horizontal:
//            layout.scrollDirection = .horizontal
////            layout.minimumLineSpacing = 16
////            layout.itemSize = CGSize(width: 150, height: 200)
//  
//        case .vertical:
//            layout.scrollDirection = .vertical
//            layout.minimumLineSpacing = 16
//            layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 100)
//            
//        case .grid(let columns):
//            let spacing: CGFloat = 16
//            let totalSpacing = spacing * CGFloat(columns - 1)
//            let width = (UIScreen.main.bounds.width - totalSpacing - 32) / CGFloat(columns)
//            layout.itemSize = CGSize(width: width, height: width)
//            layout.minimumInteritemSpacing = spacing
//            layout.minimumLineSpacing = spacing
//        }
//        
//        super.init(frame: .zero, collectionViewLayout: layout)
//        commonInit()
//    }
//    
//    private func commonInit() {
//        translatesAutoresizingMaskIntoConstraints = false
//        showsHorizontalScrollIndicator = false
//        showsVerticalScrollIndicator = false
//        backgroundColor = .clear
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}


//enum RegisteredCellType: String {
//    case topPicksCollectionViewCell
//    case categoriesCollectionViewCell
//    case universalCollectionViewCell
//    case nearbyStoresCollectionViewCell
//}
//
//extension UICollectionView {
//
//    func registerCell(type: RegisteredCellType) {
//        switch type {
//        case .topPicksCollectionViewCell:
//            self.registerCell(TopPicksCollectionViewCell.self)
//        case .categoriesCollectionViewCell:
//            self.registerCell(CategoriesCollectionViewCell.self)
//        case .universalCollectionViewCell:
//            self.registerCell(UniversalCollectionViewCell.self)
//        case .nearbyStoresCollectionViewCell:
//            self.registerCell(NearbyStoresCollectionViewCell.self)
//        }
//    }
//
////    func dequeueCell<T: UICollectionViewCell>(type: RegisteredCellType, indexPath: IndexPath) -> T {
////        guard let cell = self.dequeueReusableCell(withReuseIdentifier: type.rawValue, for: indexPath) as? T else {
////            fatalError("Unable to dequeue cell with identifier \(type.rawValue)")
////        }
////        return cell
////    }
//}
