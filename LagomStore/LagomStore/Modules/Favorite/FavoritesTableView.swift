//
//  FavoriteTableView.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/13/24.
//

import UIKit

class FavoritesTableView: UITableView {
    
    public var isEditingMode: Bool = false
    
    private var favoriteVCTableViewCell = FavoriteVCTableViewCell()

    var favoriteVCSections: [FavoriteVCSections] = []
    
//    var favoriteVCSections: [FavoriteVCSections] = [] {
//        didSet {
//            self.reloadData()
//            
//        }
//    }
            
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        delegate = self
        dataSource = self
 //       separatorStyle = .none
        allowsSelection = true
        
        registerCell(FavoriteVCTableViewCell.self)
        registerCell(OrthogonalContainerCell.self)
    }
}

// MARK: - UITableViewDelegate
extension FavoritesTableView: UITableViewDelegate {}

// MARK: - UITableViewDataSource
extension FavoritesTableView: UITableViewDataSource {
    
    enum FavoriteVCSections {
        case favorites(model: [TopPickModel])
        case findYourNextFavorite(model: [TopPickModel])
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 450
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return favoriteVCSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = favoriteVCSections[indexPath.section]
        
        switch sections {
        case .favorites(let model):
            
            let cell = tableView.dequeuCell(indexPath) as FavoriteVCTableViewCell
            cell.update(model, isEditing: isEditingMode)
  //          cell.updateCollectionViewHeight()
            return cell
       
        case .findYourNextFavorite(model: let model):
            
            let cell = tableView.dequeuCell(indexPath) as OrthogonalContainerCell
            let sectionHeight: CGFloat = 290
            cell.update(dataType: .topPicks(model), height: sectionHeight)
            
            return cell
        }
    }
}



















// MARK: - Mock OrdersService
//class MockOrdersService: OrdersServiceProtocol {
//    func fetch() -> [Product] {
//        return MockData.products
//    }
//}

// MARK: - Protocols
//protocol OrdersServiceProtocol {
//    func fetch() -> [Product]
//}
//
//class OrdersService: OrdersServiceProtocol {
//    func fetch() -> [Product] {
//        return [] // Реальная реализация сервиса
//    }
//}











//class FavoritesTableView: UITableView {
//    
//    var favoritesDataModel: [FavoriteVCSections] = []
//    
//    override init(frame: CGRect, style: UITableView.Style) {
//        super.init(frame: frame, style: style)
//        commonInit()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func commonInit() {
//        translatesAutoresizingMaskIntoConstraints = false
//        
//        delegate = self
//        dataSource = self
//        
//        separatorStyle = .none
//        allowsSelection = true
//        
//        registerCell(OrthogonalContainerCell.self)
//        registerCell(FavoriteVCTableViewCell.self)
//    }
//}
//
//// MARK: - UITableViewDelegate
//extension FavoritesTableView: UITableViewDelegate {}
//
//// MARK: - UITableViewDataSource
//extension FavoritesTableView: UITableViewDataSource {
//    
//    enum FavoriteVCSections {
//        case favorites(model: [TopPickModel], header: UniversalHeaderModel)
//        case findYourNextFavorite(model1: [TopPickModel], header: UniversalHeaderModel)
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let sections = favoritesDataModel[indexPath.section]
//        switch sections {
//        case .favorites:
//            return 450
//        case .findYourNextFavorite(_, _):
//            return 350
//        }
//    }
//    
//    func numberOfSections (in tableView: UITableView) -> Int {
//        return favoritesDataModel.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let sections = favoritesDataModel[indexPath.section]
//        
//        switch sections {
//            
//        case .favorites(let model, header: _):
//            let cell = tableView.dequeuCell(indexPath) as FavoriteVCTableViewCell
//            cell.update(model)
//            return cell
//            
//        case .findYourNextFavorite(model1: let model, header: let header):
//            let cell = tableView.dequeuCell(indexPath) as OrthogonalContainerCell
////            cell.update(model)
////            cell.updateHeader(header)
//            return cell
//        }
//    }
//}
