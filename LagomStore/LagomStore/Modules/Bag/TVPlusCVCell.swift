//
//  TVPlusCVCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/19/24.
//

import UIKit

class TVPlusCVCell: UITableViewCell {
    
    private var data: [TopPickModel] = []
    private var collectionViewHeightConstraint: NSLayoutConstraint?

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.registerCell(TestsCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true // Отключаем прокрутку
     //   collectionView.backgroundColor = .cyan
        //collectionView.heightAnchor.constraint(equalToConstant: 450).isActive = true
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

    func setupViews() {
        contentView.addSubview(collectionView)
    }

    
    func setupConstraints() {
        
        let heightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 400)
        heightConstraint.priority = .defaultHigh
        heightConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            //           collectionView.heightAnchor.constraint(equalToConstant: 400)
            

        ])
    }

    func updateData(_ data: [TopPickModel]) {
        self.data = data
        collectionView.reloadData()
        
       //updateCollectionViewHeight()
    }

        func updateCollectionViewHeight() {
            layoutIfNeeded() // Для обновления текущего размера
    
            let rows = ceil(Double(data.count) / 2.0) // Количество строк
            let itemHeight = (UIScreen.main.bounds.width - (2 * 8)) / 2
            let totalHeight = rows * Double(itemHeight) + (rows - 1) * 8 + 16
    
            if let heightConstraint = collectionView.constraints.first(where: { $0.firstAttribute == .height }) {
                heightConstraint.constant = totalHeight
            } else {
                let heightConstraint = collectionView.heightAnchor.constraint(equalToConstant: totalHeight)
                heightConstraint.isActive = true
            }
    
            layoutIfNeeded() // Применяем новые изменения
        }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension TVPlusCVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeuCell(indexPath) as TestsCollectionViewCell
        let model = data[indexPath.item]
        cell.update(model, isEdining: true)
        return cell
    }
    

}

extension TVPlusCVCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        let totalSpacing = (3 * 8) // Отступы: 2 ячейки и края секции
//        let width = (Int(collectionView.bounds.width) - totalSpacing) / 2 // Ширина ячейки
//        return CGSize(width: width, height: width) // Высота = ширина для квадратной ячейки
        
        return CGSize(width: 200, height: 300)

    }
}























//class TVPlusCVCell: UITableViewCell {
//    
//    private let containerView = UIView()
//        private var data: [TopPickModel] = []
//        
//        lazy var collectionView: UICollectionView = {
//            let layout = UICollectionViewFlowLayout()
//            layout.scrollDirection = .vertical
//    
//            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//            collectionView.translatesAutoresizingMaskIntoConstraints = false
//            collectionView.registerCell(FavoriteCollectionViewCell.self)
//            collectionView.delegate = self
//            collectionView.dataSource = self
//            collectionView.isScrollEnabled = false
//            collectionView.backgroundColor = .cyan
//            return collectionView
//        }()
//    
//        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//            super.init(style: style, reuseIdentifier: reuseIdentifier)
//            setupViews()
//            setupConstraints()
//        }
//    
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//    
//        func setupViews() {
//            contentView.addSubview(containerView)
//            containerView.addSubview(collectionView)
//
//            containerView.backgroundColor = .lightGray
//            containerView.layer.cornerRadius = 8
//            containerView.layer.masksToBounds = true
//  //          contentView.addSubview(collectionView)
//        }
//    
//        func setupConstraints() {
//            
//            containerView.translatesAutoresizingMaskIntoConstraints = false
//            
//                NSLayoutConstraint.activate([
//                    
//                    containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
//                    containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//                    containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//                    containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
//                    
//                    collectionView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
//                    collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
//                    collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -8),
//                    collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
// //                   collectionView.heightAnchor.constraint(equalToConstant: 300)
//                ])
//        }
//    
//    
//    
//    
//    
//    
////    
////            func configure(delegate: OrdersCellDelegate, indexPath: IndexPath, model: [TopPickModel]) {
////                self.delegate = delegate
////                self.indexPath = indexPath
////                self.updateData(model)
////            }
//    
//        func updateData(_ data: [TopPickModel]) {
// //           self.data = []
//            self.data = data
//            collectionView.reloadData()
//            updateCollectionViewHeight()
//        }
//    
//
//        private func updateCollectionViewHeight() {
//            collectionView.layoutIfNeeded()
//            let contentHeight = collectionView.collectionViewLayout.collectionViewContentSize.height
//            if contentHeight > 0 {
//                collectionView.heightAnchor.constraint(equalToConstant: contentHeight).isActive = true
//            }
//        }
//    
//    
//    }
//    
//    //MARK: - UICollectionViewDelegate, UICollectionViewDataSource
//    extension TVPlusCVCell: UICollectionViewDelegate, UICollectionViewDataSource {
//    
//        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//  //          return 1
//            return data.count
//        }
//    
//        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            let cell = collectionView.dequeuCell(indexPath) as FavoriteCollectionViewCell
//    
//            let model = data[indexPath.item]
//            cell.update(model, isEdining: true)
// 
//            return cell
//        }
//    
//    
//    
//    
//    }
    
