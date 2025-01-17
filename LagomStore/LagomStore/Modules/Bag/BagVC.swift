//
//  BagVC.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/13/24.
//

import UIKit

class BagVC: UIViewController {
    
    private let loader: IProductsLoader
    private let bagOrderService: OrdersServiceProtocol
    private var tableView = BagTableView()
    private var bagVCData: [TopPickModel] = []
    private let buttonView = UIView()
    private let leftButton = UIButton(type: .system)
    private let rightButton = UIButton(type: .system)
    
    init(loader: IProductsLoader, bagOrdersService: OrdersServiceProtocol = OrdersService()) {
        self.loader = loader
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
  //      tableView.bagVCData = bagVCData
        loadProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadProducts()
    }
}

// MARK: - Layout
extension BagVC {
    
    func setupViews() {
        view.addSubview(tableView)
        view.addSubview(buttonView)
        
        // Настройка buttonView
        buttonView.backgroundColor = .white
        buttonView.addSubview(leftButton)
        buttonView.addSubview(rightButton)
        
        // Настройка кнопок
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
        
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 300
//        tableView.beginUpdates()
//        tableView.endUpdates()
        
//        tableView.estimatedRowHeight = 300
 //       tableView.rowHeight = UITableView.automaticDimension
//        
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

// MARK: - Data Loading
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
















//class BagVC: UIViewController {
//    
//    private let loader: ILoader
//    private let bagOrderService: OrdersServiceProtocol
//    private var tableView = BagTableView()
//    private var bagVCData: [TopPickModel] = []
//    
//    init(loader: ILoader, bagOrdersService: OrdersServiceProtocol = OrdersService()) {
//        self.loader = loader
//        self.bagOrderService = bagOrdersService
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        title = "Bag"
////        navigationController?.navigationBar.prefersLargeTitles = true
////        setupViews()
////        setupConstraints()
////        loadBagOrders()
////    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Bag"
//        navigationController?.navigationBar.prefersLargeTitles = true
//        setupViews()
//        setupConstraints()
//
//        tableView.bagVCData = bagVCData
////        loadBagOrders()
//        
//        loadProducts()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
////        loadBagOrders()
//        
//        loadProducts()
//    }
//    
////    override func viewDidLayoutSubviews() {
////        super.viewDidLayoutSubviews()
////        tableView.beginUpdates()
////        tableView.endUpdates()
////    }
//}
//
//
//// MARK: - BussinessLogic
//extension BagVC {
////    func loadBagOrders() {
////        
////        let storedTopPicks = self.bagOrderService.fetchTopPicks()
////
////        loader.loadData { [weak self] result in
////            guard let self = self else { return }
////            
////            switch result {
////            
////            case .success(let model):
////        
////                self.bagVCData = storedTopPicks
////                
//////                self.bagVCData = model.topPicks
////                
////                DispatchQueue.main.async {
////                    self.tableView.bagVCData = self.bagVCData
////                    self.tableView.reloadData()
////                }
////            case .failure(let error):
////                print(error)
////            }
////        }
////    }
//    
//    
//    
//    
//    
//    
//    
////    func loadBagOrders() {
////        let storedTopPicks = bagOrderService.fetchTopPicks()
////        loader.loadData { [weak self] result in
////            guard let self = self else { return }
////            switch result {
////            case .success(let model):
////                DispatchQueue.main.async {
////                    self.bagVCData = storedTopPicks
////                    self.tableView.bagVCData = self.bagVCData
////                    self.tableView.reloadData()
////                }
////            case .failure(let error):
////                print(error)
////            }
////        }
////    }
//    
//    
//    
//    
//    
//    
//    
//    
//    private func updateDataModels(with products: RootModel) {
//        let storedTopPicks = bagOrderService.fetchTopPicks()
//        tableView.bagSections =
//        [
//            .firstSection(products.thankYou),
//            .secondSection(storedTopPicks),
//            .thirdSection(products.thankYou)
//        ]
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
//    
//    func loadProducts() {
//        loader.loadData { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//                
//            case .success(let products):
//                self.updateDataModels(with: products)
//                
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//}
//
//// MARK: - Layout
//extension BagVC {
//    
//    func setupViews() {
//        view.addSubview(tableView)
//    }
//    
//    func setupConstraints() {
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        
////        tableView.estimatedRowHeight = UITableView.automaticDimension
////        tableView.rowHeight = UITableView.automaticDimension
//        
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 300
//        
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//}
