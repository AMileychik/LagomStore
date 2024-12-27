//
//  Orders.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/17/24.
//

import UIKit

//protocol OrdersCellDelegate: AnyObject {
//    func didRequestDeleteItem(at indexPath: IndexPath)
//}

protocol OrdersCellDelegate: AnyObject {
    func didRequestDeleteItem(at indexPath: IndexPath, model: TopPickModel)
}

//class Orders: UITableViewCell {
//
//    weak var delegate: OrdersCellDelegate?
//    var indexPath: IndexPath?
//    
//    private var data: [TopPickModel] = []
//    var orderService: OrdersServiceProtocol = OrdersService()
//
////    private var collectionViewHeightConstraint: NSLayoutConstraint?
//
//    lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.registerCell(FavoriteCollectionViewCell.self)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.isScrollEnabled = false
// //       collectionView.backgroundColor = .orange
//        return collectionView
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupViews()
//        setupConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupViews() {
//        contentView.addSubview(collectionView)
//    }
//
//    func setupConstraints() {
////        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 0)
////        collectionViewHeightConstraint?.isActive = true
//
//            NSLayoutConstraint.activate([
//                collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
//                collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//                collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//                collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16) // Динамическая высота
//            ])
//    }
//    
//
//
//    
//    
//   
//    
//        func configure(delegate: OrdersCellDelegate, indexPath: IndexPath, model: [TopPickModel]) {
//            self.delegate = delegate
//            self.indexPath = indexPath
//            self.updateData(model)
//        }
//
//    func updateData(_ data: [TopPickModel]) {
//        self.data = []
//        self.data = data
//        collectionView.reloadData()
//        updateCollectionViewHeight()
//    }
//    
////    func updateData(_ data: [TopPickModel]) {
////        print("Updating data for cell: \(data.count) items")
////        self.data = data
////        collectionView.reloadData()
////        updateCollectionViewHeight()
////    }
//    
//
////    private func updateCollectionViewHeight() {
////        layoutIfNeeded() // Заставляем пересчитать размеры
//////        let contentHeight = collectionView.collectionViewLayout.collectionViewContentSize.height
//////        collectionViewHeightConstraint?.constant = contentHeight
////        layoutIfNeeded()
////    }
//    
//    private func updateCollectionViewHeight() {
//        collectionView.layoutIfNeeded()
//        let contentHeight = collectionView.collectionViewLayout.collectionViewContentSize.height
//        if contentHeight > 0 {
//            collectionView.heightAnchor.constraint(equalToConstant: contentHeight).isActive = true
//        }
//    }
//    
//
//}
//
////MARK: - UICollectionViewDelegate, UICollectionViewDataSource
//extension Orders: UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return data.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeuCell(indexPath) as FavoriteCollectionViewCell
//        
//        let model = data[indexPath.item]
//        cell.update(model, isEdining: true)
////        cell.onDelete = {
////            let updatedData = self.orderService.delete(model)
////            self.data = updatedData
////            self.collectionView.reloadData()
////        }
//        
////        cell.onDelete = {
////            guard let indexPath = self.indexPath else { return }
////            self.delegate?.didRequestDeleteItem(at: indexPath, model: model)
////        }
//        return cell
//    }
//    
//    
//    
//    
//}
//
//extension Orders: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.width, height: 100) // Например, 100 высота
//    }
//}
//
//extension Orders: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        // Создаем действие "Удалить"
//        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] _, _, completionHandler in
//            guard let self = self else { return }
//            
//            // Получаем модель, соответствующую ячейке
//            let model = self.data[indexPath.row]
//            
//            // Удаляем элемент через service
//            self.data = self.orderService.delete(model)
//            
//            // Обновляем таблицу
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            
//            completionHandler(true) // Завершаем обработку действия
//        }
//        
//        deleteAction.backgroundColor = .red // Устанавливаем цвет кнопки
//        
//        // Возвращаем конфигурацию свайпа
//        return UISwipeActionsConfiguration(actions: [deleteAction])
//    }
//}






class OrdersCell: UITableViewCell {
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
//    let priceLabel = Label(type: .price)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
 //       self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ model: TopPickModel) {
        priceLabel.text = model.price
    }
}

//MARK: - Layout
extension OrdersCell {
   
    func setupViews() {
        contentView.addSubview(priceLabel)
    }
    
    func setupConstraints() {
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            priceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

