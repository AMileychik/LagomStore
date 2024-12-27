//
//  UICollectionView + Extension.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/22/24.
//

import UIKit

//extension UICollectionView {
//    func configureCell<T: UICollectionViewCell>(for indexPath: IndexPath, setup: (T) -> Void) -> T {
//        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
//            fatalError("Could not dequeue cell with identifier: \(T.identifier)")
//        }
//        setup(cell)
//        return cell
//    }
//}


extension UICollectionView {
    func registerCell<Cell: UICollectionViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.reuseCVId)
    }
    
    func dequeuCell<Cell: UICollectionViewCell>(_ indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: Cell.reuseCVId, for: indexPath) as? Cell
        else { fatalError("Fatal error for cell at \(indexPath)") }
        
        return cell
    }
}
