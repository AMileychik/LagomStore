//
//  ShopCollectionView.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/29/24.
//

import UIKit

//class ShopCollectionView: UICollectionView {
//    
//    private var shopVC = ShopVC()
//    private var shopVCDataModels: [ShopVCSections] = [.buttons, .container]
//    private var selectedControllerIndex: Int = 0
//
//    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
//        super.init(frame: frame, collectionViewLayout: layout)
//        commonInit()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func commonInit() {
//        translatesAutoresizingMaskIntoConstraints = false
//        delegate = self
//        dataSource = self
//        isScrollEnabled = true
//        
//        registerCell(ButtonCell.self)
//        registerCell(ContainerCell.self)
//        registerCell(ThisWeekTop.self)
//    }
//}
//
//extension ShopCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    
//    enum ShopVCSections {
//        case buttons
//        case container
//    }
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return shopVCDataModels.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let sectionsData = shopVCDataModels[indexPath.section]
//        
//        switch sectionsData {
//        case .buttons:
//            let cell = collectionView.dequeuCell(indexPath) as ButtonCell
//            cell.buttonTapAction = { [weak self] index in
//                guard let self = self else { return }
//                self.selectedControllerIndex = index
//                self.reloadSections(IndexSet(integer: 1))
//            }
//            return cell
//            
//        case .container:
//            let cell = collectionView.dequeuCell(indexPath) as ContainerCell
//            cell.parentViewController = shopVC  // Устанавливаем parentViewController
//            cell.addChildViewController(at: selectedControllerIndex)
//            return cell
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let sectionsData = shopVCDataModels[indexPath.section]
//
//        switch sectionsData {
//        case .buttons:
//            return CGSize(width: collectionView.frame.width, height: 50)
//        case .container:
//            return CGSize(width: collectionView.frame.width, height: 1500)
//        }
//    }
//}



    
    
    

