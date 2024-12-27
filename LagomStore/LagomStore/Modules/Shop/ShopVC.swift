//
//  ShopVC.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/30/24.
//

import UIKit

class ShopVC: UIViewController {
    
    private let loader: IProductsLoader
    private lazy var tableView = ShopTableView(loader: loader)
    
    init(loader: IProductsLoader) {
        self.loader = loader
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shop"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupView()
        setupConstraints()
        loadProducts()
    }
}

// MARK: - Business Logic
extension ShopVC {
    
    private func updateDataModels(with products: RootModel) {
        tableView.shopDataModels = [
            .buttons(products.shopButtons),
            .thisWeekTopStories(model: products.topPicks, header: products.headers.titleHeaderModel),
//            .list(rows: [
//                    .nested(ThankYouModel(image: "ThankYou")),
//                    .nested(ThankYouModel(image: "ThankYou"))
//                ]),
            .list(products.thankYou),
            .newAndFeatured(model: products.topPicks, header: products.headers.titleHeaderModel),
            .recentlyViewed(model: products.topPicks, header: products.headers.titleHeaderModel),
            .classicsSpotlight(model: products.topPicks, header: products.headers.titleHeaderModel),
            .recommendedForYou(model: products.topPicks, header: products.headers.titleHeaderModel),
            .nearbyStore(model: products.thankYou, header: products.headers.titleHeaderModel)
        ]
        tableView.reloadData()
    }
    
    func loadProducts() {
        loader.loadProducts { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let products):
                self.updateDataModels(with: products)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - Layout
extension ShopVC {
    
    func setupView() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


