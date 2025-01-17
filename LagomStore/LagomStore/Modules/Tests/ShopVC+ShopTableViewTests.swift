//
//  ShopVCTest.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/24/24.
//

import Foundation

//class ShopVC: UIViewController {
//
//    // MARK: - Properties
//    private let loader: IProductsLoader
//    private lazy var tableView = ShopTableView(loader: loader)
//    
//    // MARK: - Initializers
//    init(loader: IProductsLoader) {
//        self.loader = loader
//  //      self.tableView = ShopTableView(loader: loader)
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Shop"
//        navigationController?.navigationBar.prefersLargeTitles = true
//        setupView()
//        setupConstraints()
//        loadProducts()
//    }
//}
//
//// MARK: - Business Logic
//extension ShopVC {
//
//    private func updateDataModels(with products: RootModel) {
//        tableView.shopDataModels = [
//            .buttons(products.shopButtons),
//            .thisWeekTopStories(model: products.topPicks, header: products.headers.titleHeaderModel),
//            .list(products.thankYou),
//            .newAndFeatured(model: products.topPicks, header: products.headers.titleHeaderModel),
//            .recentlyViewed(model: products.topPicks, header: products.headers.titleHeaderModel),
//            .claccicsSpotlight(model: products.topPicks, header: products.headers.titleHeaderModel),
//            .recommendedForYou(model: products.topPicks, header: products.headers.titleHeaderModel),
//            .nearbyStore(model: products.thankYou, header: products.headers.titleHeaderModel)
//        ]
//        
//            tableView.reloadData()
//    }
//
//    func loadProducts() {
//        loader.loadProducts { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success(let products):
//                self.updateDataModels(with: products)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//}
//
//// MARK: - Layout
//extension ShopVC {
//    
//    func setupView() {
//        view.addSubview(tableView)
//    }
//    
//    func setupConstraints() {
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//}


//import UIKit
//
//class ShopTableView: UITableView {
//    
//    private let loader: IProductsLoader
//    var shopDataModels: [ShopVCSections] = []
//    private var selectedButtonIndex: Int = 0
//    
//    init(loader: IProductsLoader) {
//        self.loader = loader
//        super.init(frame: .zero, style: .plain)
//        commonInit()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func commonInit() {
//        delegate = self
//        dataSource = self
//        separatorStyle = .none
//        allowsSelection = false
//        
//        registerCell(ButtonsCell.self)
//        registerCell(OrthogonalContainerCell.self)
//        registerCell(ShopListCell.self)
//        registerCell(NewAndFeaturedCell.self)
//        registerCell(RecentlyViewedCell.self)
//        registerCell(NearbyStoresCell.self)
//    }
//}
//
//// MARK: - Business Logic
//extension ShopTableView {
//    
//    enum ButtonDataType {
//        case men
//        case women
//        case kids
//    }
//    
//    private func updateCategories(with products: RootModel, for buttonDataType: ButtonDataType) {
//        switch buttonDataType {
//            
//        case .men:
//            shopDataModels = [
//                .buttons(products.shopButtons),
//                .thisWeekTopStories(model: products.topPicks, header: products.headers.titleHeaderModel),
//                .list(products.thankYou),
//                .newAndFeatured(model: products.topPicks, header: products.headers.titleHeaderModel),
//                .recentlyViewed(model: products.topPicks, header: products.headers.titleHeaderModel),
//                .claccicsSpotlight(model: products.topPicks, header: products.headers.titleHeaderModel),
//                .recommendedForYou(model: products.topPicks, header: products.headers.titleHeaderModel),
//                .nearbyStore(model: products.thankYou, header: products.headers.titleHeaderModel)
//            ]
//            
//        case .women:
//            shopDataModels = [
//                .buttons(products.shopButtons),
//                .thisWeekTopStories(model: products.topPicks, header: products.headers.titleHeaderModel),
//                .newAndFeatured(model: products.topPicks, header: products.headers.titleHeaderModel),
//                .recentlyViewed(model: products.topPicks, header: products.headers.titleHeaderModel),
//                .claccicsSpotlight(model: products.topPicks, header: products.headers.titleHeaderModel),
//                .list(products.thankYou),
//                .recommendedForYou(model: products.topPicks, header: products.headers.titleHeaderModel),
//                .nearbyStore(model: products.thankYou, header: products.headers.titleHeaderModel)
//            ]
//            
//        case .kids:
//            shopDataModels = [
//                .buttons(products.shopButtons),
//                .list(products.thankYou),
//                .newAndFeatured(model: products.topPicks, header: products.headers.titleHeaderModel),
//                .claccicsSpotlight(model: products.topPicks, header: products.headers.titleHeaderModel),
//                .recommendedForYou(model: products.topPicks, header: products.headers.titleHeaderModel),
//                .nearbyStore(model: products.thankYou, header: products.headers.titleHeaderModel)
//            ]
//        }
//        DispatchQueue.main.async {
//            self.reloadData()
//        }
//    }
//    
//    func loadProducts(for buttonDataType: ButtonDataType) {
//        loader.loadProducts { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success(let products):
//                self.updateCategories(with: products, for: buttonDataType)
//            case .failure(let error):
//                print("Failed to load products: \(error)")
//            }
//        }
//    }
//    
//    func removeSection(at index: Int) {
//        //        guard index >= 0 && index < shopDataModels.count else {
//        //            print("Invalid section index: \(index)")
//        //            return
//        //        }
//        shopDataModels.remove(at: index)
//        beginUpdates()
//        deleteSections(IndexSet(integer: index), with: .bottom)
//        endUpdates()
//    }
//    
//    // MARK: - Buttons Cell Configuration
//    private func configureButtonsCell(_ cell: ButtonsCell, tableView: UITableView) {
//        cell.menButtonAction = { [weak self] index in
//            self?.handleButtonTap(index, tableView: tableView)
//        }
//        cell.womenButtonAction = { [weak self] index in
//            self?.handleButtonTap(index, tableView: tableView)
//        }
//        cell.kidsButtonAction = { [weak self] index in
//            self?.handleButtonTap(index, tableView: tableView)
//        }
//        cell.configureHeight(50)
//    }
//    
//    private func handleButtonTap(_ index: Int, tableView: UITableView) {
//        
//        let buttonTypes: [ButtonDataType] =
//        [
//            .men,
//                .women,
//            .kids
//        ]
//        
//        guard index >= 0 && index < buttonTypes.count else { return } // Проверка валидности индекса
//        
//        let buttonType = buttonTypes[index]
//        loadProducts(for: buttonType)
//        selectedButtonIndex = index
//        tableView.reloadSections(IndexSet(integer: 1), with: .none)
//    }
//}
//
//// MARK: - UITableViewDataSource
//extension ShopTableView: UITableViewDataSource {
//    
//    enum ShopVCSections {
//        case buttons(ShopButtonsModel)
//        case thisWeekTopStories(model: [TopPickModel], header: TitleHeaderModel)
//        case list([ThankYouModel])
//        case newAndFeatured(model: [TopPickModel], header: TitleHeaderModel)
//        case recentlyViewed(model: [TopPickModel], header: TitleHeaderModel)
//        case claccicsSpotlight(model: [TopPickModel], header: TitleHeaderModel)
//        case recommendedForYou(model: [TopPickModel], header: TitleHeaderModel)
//        case nearbyStore(model: [ThankYouModel], header: TitleHeaderModel)
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return shopDataModels.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let sections = shopDataModels[indexPath.section]
//        
//        switch sections {
//        case .buttons(let model):
//            let cell = tableView.dequeuCell(indexPath) as ButtonsCell
//            configureButtonsCell(cell, tableView: tableView)
//            cell.uptadeButtonCell(model)
//            return cell
//            
//        case .thisWeekTopStories(let model, let header):
//            let cell = tableView.dequeuCell(indexPath) as OrthogonalContainerCell
//            cell.update(dataType: .thisWeekTopStories(model), height: 350)
//            cell.updateHeader(header)
//            return cell
//            
//        case .list(let model):
//            let cell = tableView.dequeuCell(indexPath) as ShopListCell
//            cell.configure(model, heights: [110, 110, 110, 110])
//            return cell
//            
//        case .newAndFeatured(let model, let header):
//            let cell = tableView.dequeuCell(indexPath) as NewAndFeaturedCell
//            cell.updateNewAndFeaturedSection(model, heights: 30)
//            cell.configureHeader(with: header)
//            cell.updateCollectionViewHeight(275)
//            return cell
//            
//        case .recentlyViewed(let model, let header):
//            let cell = tableView.dequeuCell(indexPath) as RecentlyViewedCell
//            cell.updateRecentlyViewed(model)
//            cell.configureHeader(with: header)
//            cell.updateCollectionViewHeight(250)
//            
//            if case .recentlyViewed = sections {
//                cell.onRemoveSection = { [weak self] in
//                    guard let self = self else { return }
//                    self.removeSection(at: indexPath.section)
//                }
//            }
//            return cell
//            
//        case .claccicsSpotlight(let model, let header):
//            let cell = tableView.dequeuCell(indexPath) as NewAndFeaturedCell
//            cell.updateNewAndFeaturedSection(model, heights: 175)
//            cell.configureHeader(with: header)
//            cell.updateCollectionViewHeight(275)
//            return cell
//            
//        case .recommendedForYou(let model, let header):
//            let cell = tableView.dequeuCell(indexPath) as RecentlyViewedCell
//            cell.updateRecentlyViewed(model)
//            cell.configureRecommendedForYouHeader(with: header)
//            cell.updateCollectionViewHeight(250)
//            return cell
//            
//        case .nearbyStore(let model, let header):
//            let cell = tableView.dequeuCell(indexPath) as NearbyStoresCell
//            cell.updateSection(.nearbyStoreSectionData(models: model))
//            cell.configureHeader(with: header)
//            cell.updateCollectionViewHeight(250)
//            return cell
//        }
//    }
//}
//
//// MARK: - UITableViewDelegate
//extension ShopTableView: UITableViewDelegate {}
