//
//  HomeTableView.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/29/24.
//

import UIKit

class HomeTableView: UITableView {
    
    var homeSections: [HomeSections] = []
    weak var viewcontroller: UIViewController?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        delegate = self
        dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
        separatorStyle = .none
        allowsSelection = false
        
        registerCell(WelcomeCell.self)
        registerCell(OrthogonalContainerCell.self)
        registerCell(PageControlCell.self)
        registerCell(HomeListCell.self)
        registerCell(AlwaysPopularCell.self)
        registerCell(NearbyStoresCell.self)
        registerCell(ThankYouCell.self)
    }
}

//MARK: - TableDataSource
extension HomeTableView: UITableViewDataSource {
    enum HomeSections {
        case welcome(String)
        case topPicks([TopPickModel], header: UniversalHeaderModel)
        case pageControl([PageControlModel])
        case list([ListModel], header: ListHeaderModel)
        case productCategory1([TopPickModel], header: UniversalHeaderModel)
        case alwaysPopular([AlwaysPopularModel])
        case productCategory2([PageControlModel], header: UniversalHeaderModel)
        case thankYou([ThankYouModel])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return homeSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionData = homeSections[indexPath.section]
        switch sectionData {
            
        case .welcome(let text):
            let cell = tableView.dequeuCell(indexPath) as WelcomeCell
            cell.update(text)
            return cell
            
        case .topPicks(let model, let header):
            let cell = tableView.dequeuCell(indexPath) as OrthogonalContainerCell
            let sectionHeight: CGFloat = 300
            cell.update(dataType: .thisWeekTopStories(model), height: sectionHeight)
            cell.update(header)
            cell.delegate = self
            return cell
            
        case .pageControl(let model):
            let cell = tableView.dequeuCell(indexPath) as PageControlCell
            let sectionHeight: CGFloat = 150
            cell.update(model, height: sectionHeight)
            cell.isAutoScrollingEnabled = false
            return cell
            
        case .list(let model, let header):
            let cell = tableView.dequeuCell(indexPath) as HomeListCell
            cell.update(model, heights: [400, 400, 400, 200], gradientIndexes: [3])
            cell.update(header)
            return cell
            
        case .productCategory1(let model, let header):
            let cell = tableView.dequeuCell(indexPath) as OrthogonalContainerCell
            let sectionHeight: CGFloat = 400
            cell.update(dataType: .topPicks(model), height: sectionHeight)
            cell.update(header)
            cell.delegate = self
            return cell
            
        case .alwaysPopular(let model):
            let cell = tableView.dequeuCell(indexPath) as AlwaysPopularCell
            let model = model[indexPath.item]
            cell.update(model)
            return cell
            
        case .productCategory2(let model, let header):
            let cell = tableView.dequeuCell(indexPath) as OrthogonalContainerCell
            let sectionHeight: CGFloat = 250
            cell.update(dataType: .productCategory2(model), height: sectionHeight)
            cell.update(header)
            cell.delegate = self
            return cell
            
        case .thankYou(let model):
            let cell = tableView.dequeuCell(indexPath) as ThankYouCell
            let model = model[indexPath.item]
            cell.update(model)
            return cell
        }
    }
}

//MARK: - TableDelegate
extension HomeTableView: UITableViewDelegate {}

//MARK: - OrthogonalContainerCellDelegate
extension HomeTableView: OrthogonalContainerCellDelegate {
    
    func didSelectItem(with model: [TopPickModel], category: String) {
        let detailVC = di.screenFactory.makeDetailScreen()
        detailVC.updateWithCategory(model, category: category)
        viewcontroller?.navigationController?.pushViewController(detailVC, animated: true)
 //       print("\(category)")
    }
    
    func didSelectItem2(with model: [PageControlModel]) {
        let detailVC = di.screenFactory.makeDetailScreen()
        detailVC.updateWithCategory2(model)
        viewcontroller?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
