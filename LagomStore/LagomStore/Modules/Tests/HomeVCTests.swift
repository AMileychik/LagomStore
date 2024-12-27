//
//  HomeVCTests.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/24/24.
//

//import UIKit
//
//final class HomeVC: UIViewController {
//    
//    private let homeLoader: IProductsLoader
//    private var tableView = HomeTableView()
//    
//    private var welcomeText: String = Date().welcomeText
////    private var welcomeText: String {
////        Date().welcomeText
////    }
//    private var refreshControl = UIRefreshControl()
//    
//    init(homeLoader: IProductsLoader) {
//        self.homeLoader = homeLoader
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.viewcontroller = self
//        setupNavigationBar()
//        setupViews()
//        setupConstraints()
//        loadProducts()
//        refreshHomeVC()
//    }
//    
//    private func setupNavigationBar() {
//        let rightButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
//                                          style: .plain,
//                                          target: self,
//                                          action: #selector(rightButtonTapped))
// //       rightButton.tintColor = .black
//        navigationItem.rightBarButtonItem = rightButton
//    }
//    
//    @objc private func rightButtonTapped() {}
//    
//    private func refreshHomeVC() {
//        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
//        tableView.refreshControl = refreshControl
//    }
//    
//    @objc private func refreshData() {
//        loadProducts()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.refreshControl.endRefreshing()
//        }
//    }
//}
//
////MARK: - Business Logic
//extension HomeVC {
//    
//    private func updateDataModels(with products: RootModel) {
//        tableView.homeSections =
//        [
//            .welcome(self.welcomeText),
//            .topPicks(products.topPicks, header: products.headers.topPicksHeaderModel),
//            .pageControl(products.pageControl),
//            .list(products.listModel, header: products.headers.listHeader),
//            .productCategory1(products.topPicks, header: products.headers.topPicksHeaderModel),
//            .alwaysPopular(products.alwaysPopular),
//            .productCategory2(products.pageControl, header: products.headers.topPicksHeaderModel),
//            .thankYou(products.thankYou)
//        ]
////        DispatchQueue.main.async {
//            self.tableView.reloadData()
////        }
//    }
//    
//    func loadProducts() {
//        homeLoader.loadProducts { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//                
//            case .success(let products):
//                self.updateDataModels(with: products)
//            case .failure(let error):
////                print(error)
//                self.handleError(error)
//            }
//        }
//    }
//
//    private func handleError(_ error: Error) {
//        print("Failed to load products: \(error)")
//        // Можно добавить отображение ошибки через UIAlertController или другой механизм
//    }
//}
//
////MARK: - Layout
//private extension HomeVC {
//
//    func setupViews() {
//        view.addSubview(tableView)
//    }
//    
//    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
//    }
//}


//final class HomeVC: UIViewController {
//
//    private let homeLoader: IProductsLoader
//    private lazy var tableView = createTableView()
//    private lazy var refreshControl = createRefreshControl()
//
//    init(homeLoader: IProductsLoader) {
//        self.homeLoader = homeLoader
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureNavigationBar()
//        configureViews()
//        configureConstraints()
//        loadProducts()
//    }
//
//    private var welcomeText: String {
//        Date().welcomeText
//    }
//}
//
//// MARK: - Business Logic
//extension HomeVC {
//
//    private func updateDataModels(with products: RootModel) {
//        let headers = products.headers
//        tableView.homeSections = [
//            .welcome(welcomeText),
//            .topPicks(products.topPicks, header: headers.topPicksHeaderModel),
//            .pageControl(products.pageControl),
//            .list(products.listModel, header: headers.listHeader),
//            .productCategory1(products.topPicks, header: headers.topPicksHeaderModel),
//            .alwaysPopular(products.alwaysPopular),
//            .productCategory2(products.pageControl, header: headers.topPicksHeaderModel),
//            .thankYou(products.thankYou)
//        ]
//        tableView.reloadData()
//    }
//
//    func loadProducts() {
//        homeLoader.loadProducts { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success(let products):
//                self.updateDataModels(with: products)
//            case .failure(let error):
//                self.handleError(error)
//            }
//        }
//    }
//
//    private func handleError(_ error: Error) {
//        print("Failed to load products: \(error)")
//    }
//}
//
//// MARK: - UI Configuration
//private extension HomeVC {
//
//    func configureNavigationBar() {
//        let rightButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
//                                          style: .plain,
//                                          target: self,
//                                          action: #selector(rightButtonTapped))
//        navigationItem.rightBarButtonItem = rightButton
//    }
//
//    @objc func rightButtonTapped() {
//        // TODO: Add functionality
//    }
//
//    func configureViews() {
//        view.addSubview(tableView)
//    }
//
//    func configureConstraints() {
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
//    }
//
//    func createTableView() -> HomeTableView {
//        let tableView = HomeTableView()
//        tableView.viewcontroller = self
//        tableView.refreshControl = refreshControl
//        return tableView
//    }
//
//    func createRefreshControl() -> UIRefreshControl {
//        let refreshControl = UIRefreshControl()
//        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
//        return refreshControl
//    }
//
//    @objc func refreshData() {
//        loadProducts()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.refreshControl.endRefreshing()
//        }
//    }
//}
