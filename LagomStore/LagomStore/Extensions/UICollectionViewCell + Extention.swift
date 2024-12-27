//
//  UICollectionViewCell + Extention.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/22/24.
//

import UIKit

//extension UICollectionViewCell {
//    static var identifier: String {
//        return String(describing: self)
//    }
//}


protocol ReusableCollectionViewCell {}

extension UICollectionViewCell: ReusableCollectionViewCell {}

extension ReusableCollectionViewCell where Self: UICollectionViewCell {
    
    static var reuseCVId: String {
        return String.init(describing: self)
    }
}
