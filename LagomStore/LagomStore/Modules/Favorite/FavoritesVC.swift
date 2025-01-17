//
//  FavoriteVC.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/13/24.
//

import UIKit

final class FavoritesVC: UIViewController {
    
    private let favoritesLoader: IProductsLoader
    private let ordersService: OrdersServiceProtocol
    private var tableView = FavoritesTableView()
    private var isEditingMode = false
    
    init(favoritesLoader: IProductsLoader, ordersService: OrdersServiceProtocol = OrdersService()) {
        self.favoritesLoader = favoritesLoader
        self.ordersService = ordersService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        setupView()
        setupConstraints()
        loadSecondSection()
    }
    
    func clearUserDefaults() {
        UserDefaults.standard.removeObject(forKey: "TopPicksKey")
        UserDefaults.standard.synchronize()
    }
    
    private func setupNavigationBar() {
      
        let rightButton = UIBarButtonItem(title: "Edit",
                                          style: .plain,
                                          target: self,
                                          action: #selector(rightButtonTapped))
        
        rightButton.tintColor = .gray
        navigationItem.rightBarButtonItem = rightButton
    }

    @objc private func rightButtonTapped() {
        isEditingMode.toggle()
        tableView.isEditingMode = isEditingMode
        navigationItem.rightBarButtonItem?.title = isEditingMode ? "Done" : "Edit"
        loadSecondSection()
    }
}

// MARK: - Business Logic
extension FavoritesVC {
    private func updateSections(with rootModel: RootModel) {
        
        let storedTopPicks = ordersService.fetchTopPicks()
        
        tableView.favoriteVCSections = [
            .favorites(model: storedTopPicks),
            .findYourNextFavorite(model: rootModel.topPicks)
        ]
            self.tableView.reloadData()
    }
    
    private func loadSecondSection() {
        favoritesLoader.loadProducts { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let products):
                self.updateSections(with: products)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - Layout
extension FavoritesVC {
    
    private func setupView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}




