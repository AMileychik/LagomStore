//
//  FavoriteTableView.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/13/24.
//

import UIKit

class FavoritesTableView: UITableView {
    
    var favoriteVCSections: [FavoriteVCSections] = []
    public var isEditingMode: Bool = false

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

// MARK: - TableViewDataSource
extension FavoritesTableView: UITableViewDataSource {
   
    enum FavoriteVCSections {
        case favorites(model: [TopPickModel])
        case findYourNextFavorite(model: [TopPickModel])
    }
    
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
            return cell
       
        case .findYourNextFavorite(model: let model):
            let cell = tableView.dequeuCell(indexPath) as OrthogonalContainerCell
            cell.update(dataType: .topPicks(model), sectionHeight: 290)
            return cell
        }
    }
}

// MARK: - TableViewDelegate
extension FavoritesTableView: UITableViewDelegate {}













