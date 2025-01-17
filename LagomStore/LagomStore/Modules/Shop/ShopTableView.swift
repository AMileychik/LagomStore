////
////  ShopTableView.swift
////  LagomStore
////
////  Created by Александр Милейчик on 10/30/24.
////
//
import UIKit

class ShopTableView: UITableView {
    
    private let shopLoader: IProductsLoader
    var shopDataModels: [ShopVCSections] = []
    private var selectedButtonIndex: Int = 0
    
    init(shopLoader: IProductsLoader) {
        self.shopLoader = shopLoader
        super.init(frame: .zero, style: .plain)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        delegate = self
        dataSource = self
        separatorStyle = .none
        allowsSelection = false
        
        registerCell(ButtonsCell.self)
        registerCell(OrthogonalContainerCell.self)
        registerCell(ShopListCell.self)
        registerCell(NewAndFeaturedCell.self)
        registerCell(RecentlyViewedCell.self)
        registerCell(NearbyStoresCell.self)
        registerCell(NestedCell.self)
    }
}

// MARK: - Business Logic
extension ShopTableView {
    
    enum ButtonDataType {
        case men
        case women
        case kids
    }
    
    private func updateCategories(with products: RootModel, for buttonDataType: ButtonDataType) {
        switch buttonDataType {
            
        case .men:
            shopDataModels = [
                .buttons(products.shopButtons),
                .thisWeekTopStories(model: products.topPicks, header: products.headers.titleHeaderModel),
                .list(products.thankYou),
                .newAndFeatured(model: products.topPicks, header: products.headers.titleHeaderModel),
                .recentlyViewed(model: products.topPicks, header: products.headers.titleHeaderModel),
                .classicsSpotlight(model: products.topPicks, header: products.headers.titleHeaderModel),
                .recommendedForYou(model: products.topPicks, header: products.headers.titleHeaderModel),
                .nearbyStore(model: products.thankYou, header: products.headers.titleHeaderModel)
            ]
            
        case .women:
            shopDataModels = [
                .buttons(products.shopButtons),
                .thisWeekTopStories(model: products.topPicks, header: products.headers.titleHeaderModel),
                .newAndFeatured(model: products.topPicks, header: products.headers.titleHeaderModel),
                .recentlyViewed(model: products.topPicks, header: products.headers.titleHeaderModel),
                .classicsSpotlight(model: products.topPicks, header: products.headers.titleHeaderModel),
                .list(products.thankYou),
                .recommendedForYou(model: products.topPicks, header: products.headers.titleHeaderModel),
                .nearbyStore(model: products.thankYou, header: products.headers.titleHeaderModel)
            ]
            
        case .kids:
            shopDataModels = [
                .buttons(products.shopButtons),
                .list(products.thankYou),
                .newAndFeatured(model: products.topPicks, header: products.headers.titleHeaderModel),
                .classicsSpotlight(model: products.topPicks, header: products.headers.titleHeaderModel),
                .recommendedForYou(model: products.topPicks, header: products.headers.titleHeaderModel),
                .nearbyStore(model: products.thankYou, header: products.headers.titleHeaderModel)
            ]
        }
        self.reloadData()
    }
    
    func loadProducts(for buttonDataType: ButtonDataType) {
        shopLoader.loadProducts { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let products):
                self.updateCategories(with: products, for: buttonDataType)
            case .failure(let error):
                print("Failed to load products: \(error)")
            }
        }
    }
    
    func removeSection(at index: Int) {
        guard index >= 0 && index < shopDataModels.count else {
            print("Invalid section index: \(index)")
            return
        }
        shopDataModels.remove(at: index)
        beginUpdates()
        deleteSections(IndexSet(integer: index), with: .bottom)
        endUpdates()
    }
    
    // MARK: - Buttons Cell Configuration
    private func configureButtonsCell(_ cell: ButtonsCell, tableView: UITableView) {
        cell.menButtonAction = { [weak self] index in
            self?.handleButtonTap(index, tableView: tableView)
        }
        cell.womenButtonAction = { [weak self] index in
            self?.handleButtonTap(index, tableView: tableView)
        }
        cell.kidsButtonAction = { [weak self] index in
            self?.handleButtonTap(index, tableView: tableView)
        }
        cell.configureHeight(50)
    }
    
    private func handleButtonTap(_ index: Int, tableView: UITableView) {
        
        let buttonTypes: [ButtonDataType] =
        [
            .men,
            .women,
            .kids
        ]
        
        guard index >= 0 && index < buttonTypes.count else { return } // Проверка валидности индекса
        
        let buttonType = buttonTypes[index]
        loadProducts(for: buttonType)
        selectedButtonIndex = index
        tableView.reloadSections(IndexSet(integer: 1), with: .none)
    }
}

// MARK: - UITableViewDataSource
extension ShopTableView: UITableViewDataSource {
    
    enum ShopVCSections {
        case buttons(ShopButtonsModel)
        case thisWeekTopStories(model: [TopPickModel], header: TitleHeaderModel)
        case list([ThankYouModel])
        case newAndFeatured(model: [TopPickModel], header: TitleHeaderModel)
        case recentlyViewed(model: [TopPickModel], header: TitleHeaderModel)
        case classicsSpotlight(model: [TopPickModel], header: TitleHeaderModel)
        case recommendedForYou(model: [TopPickModel], header: TitleHeaderModel)
        case nearbyStore(model: [ThankYouModel], header: TitleHeaderModel)
    }
    
    enum ListRow{
        case nested(ThankYouModel)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return shopDataModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionData = shopDataModels[section]
            switch sectionData {
            case .list(let rows):
                return rows.count
            default:
                return 1
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = shopDataModels[indexPath.section]
        
        switch sections {
        case .buttons(let model):
            let cell = tableView.dequeuCell(indexPath) as ButtonsCell
            configureButtonsCell(cell, tableView: tableView)
            cell.updateButtonCell(model)
            return cell
            
        case .thisWeekTopStories(let model, let header):
            let cell = tableView.dequeuCell(indexPath) as OrthogonalContainerCell
            cell.updateHeader(header)
            cell.update(dataType: .thisWeekTopStories(model), sectionHeight: 350)
            return cell
              
        case .list(let rows):
            let cell = tableView.dequeuCell(indexPath) as NestedCell
            let model = rows[indexPath.row]
            cell.updateShopListCell(with: model)
            return cell
            
        case .newAndFeatured(let model, let header):
            let cell = tableView.dequeuCell(indexPath) as NewAndFeaturedCell
            cell.update(header)
            cell.update(model, sectionHeight: 300)
            return cell
            
        case .recentlyViewed(let model, let header):
            let cell = tableView.dequeuCell(indexPath) as RecentlyViewedCell
            cell.update(header)
            cell.update(model, sectionHeight: 270)
            
            if case .recentlyViewed = sections {
                cell.onRemoveSection = { [weak self] in
                    guard let self = self else { return }
                    self.removeSection(at: indexPath.section)
                }
            }
            return cell
            
        case .classicsSpotlight(let model, let header):
            let cell = tableView.dequeuCell(indexPath) as NewAndFeaturedCell
            cell.update(header)
            cell.update(model, sectionHeight: 295)
            return cell
            
        case .recommendedForYou(let model, let header):
            let cell = tableView.dequeuCell(indexPath) as RecentlyViewedCell
            cell.update(header)
            cell.update(model, sectionHeight: 290)
            return cell
            
        case .nearbyStore(let model, let header):
            let cell = tableView.dequeuCell(indexPath) as NearbyStoresCell
            cell.update(header)
            cell.update(.nearbyStoreSectionData(models: model), sectionHeight: 300)
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension ShopTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let section = shopDataModels[indexPath.section]
        switch section {
        case .list:
            return 110
            
        default:
            return UITableView.automaticDimension // Автоматическая высота для остальных секций
        }
    }
}
