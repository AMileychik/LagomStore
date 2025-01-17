//
//  BagVC.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/13/24.
//

import UIKit

class BagVC: UIViewController {
    
    private let bagLoader: IProductsLoader
    private let bagOrderService: OrdersServiceProtocol
    private var tableView = BagTableView()
    
    private let buttonView  = UIView()
    private let leftButton  = UIButton(type: .system)
    private let rightButton = UIButton(type: .system)
    
    init(bagLoader: IProductsLoader, bagOrdersService: OrdersServiceProtocol = OrdersService()) {
        self.bagLoader = bagLoader
        self.bagOrderService = bagOrdersService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bag"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupViews()
        setupConstraints()
        loadProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadProducts()
    }
}

// MARK: - DataLoading
extension BagVC {
    private func updateDataModels(with products: RootModel) {
        
        let storedTopPicks = bagOrderService.fetchTopPicks()
      
        tableView.bagSections = [
            .firstSection(products.promotionModel),
            .secondSection(storedTopPicks),
            .thirdSection(products.topPicks)
        ]
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func loadProducts() {
        bagLoader.loadProducts { [weak self] result in
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
extension BagVC {
    
    func setupViews() {
        view.addSubview(tableView)
        view.addSubview(buttonView)
        
        buttonView.backgroundColor = .white
        buttonView.addSubview(leftButton)
        buttonView.addSubview(rightButton)
        
        leftButton.setTitle("Левая", for: .normal)
        rightButton.setTitle("Правая", for: .normal)
        
        leftButton.backgroundColor = .systemBlue
        leftButton.setTitleColor(.white, for: .normal)
        rightButton.backgroundColor = .systemGreen
        rightButton.setTitleColor(.white, for: .normal)
        
        leftButton.layer.cornerRadius = 10
        rightButton.layer.cornerRadius = 10
    }
    
    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // Констрейнты для таблицы
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: buttonView.topAnchor),
            
            // Констрейнты для buttonView
            buttonView.heightAnchor.constraint(equalToConstant: 80),
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // Констрейнты для левой кнопки
            leftButton.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 16),
            leftButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            leftButton.heightAnchor.constraint(equalToConstant: 30),
            leftButton.widthAnchor.constraint(equalToConstant: 100),
            
            // Констрейнты для правой кнопки
            rightButton.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: -16),
            rightButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            rightButton.heightAnchor.constraint(equalToConstant: 30),
            rightButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
