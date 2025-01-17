////
////  FavoriteVC + FavoritesTableView + Test.swift
////  LagomStore
////
////  Created by Александр Милейчик on 1/2/25.
////
//
//import Foundation
//
//import UIKit
//
//final class FavoritesVC: UIViewController {
//    
//    private let loader: IProductsLoader
//    private let ordersService: OrdersServiceProtocol
//    private var tableView = FavoritesTableView()
//    private var favoriteVCTableViewCell = FavoriteVCTableViewCell()
//    private var isEditingMode = false
//    private var favoriteCell: FavoriteVCTableViewCell?
//    
//    init(loader: IProductsLoader, ordersService: OrdersServiceProtocol = OrdersService()) {
//        self.loader = loader
//        self.ordersService = ordersService
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Favorites"
//        navigationController?.navigationBar.prefersLargeTitles = true
//        //setupNavigationBar()
//        //setupView()
//        //setupConstraints()
//        //loadSecondSection()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        setupNavigationBar()
//        setupView()
//        setupConstraints()
//
//        loadSecondSection()
//    }
//    
//
//    
//    func clearUserDefaults() {
//        UserDefaults.standard.removeObject(forKey: "TopPicksKey")
//        UserDefaults.standard.synchronize()
//    }
//    
//    private func setupNavigationBar() {
//      
//        let rightButton = UIBarButtonItem(title: "Edit",
//                                          style: .plain,
//                                          target: self,
//                                          action: #selector(rightButtonTapped))
//        
//        rightButton.tintColor = .gray
//        navigationItem.rightBarButtonItem = rightButton
//    }
//
//    
//////
////    @objc private func rightButtonTapped() {
////
////            isEditingMode.toggle() // Меняем состояние редактирования
////            tableView.isEditingMode = isEditingMode
//// //           tableView.reloadData() // Обновляем таблицу для передачи нового состояния
////            navigationItem.rightBarButtonItem?.title = isEditingMode ? "Done" : "Edit" // Меняем заголовок кнопки
////
////            loadSecondSection()
////    }
//    
//    
//    
//    
//// More soft reloading
//    @objc private func rightButtonTapped() {
//        isEditingMode.toggle()
//        tableView.isEditingMode = isEditingMode
//        navigationItem.rightBarButtonItem?.title = isEditingMode ? "Done" : "Edit"
//
//        // Перезагрузка конкретной секции
//        loadSecondSection()
//        
////        DispatchQueue.main.async {
////            if let index = self.tableView.favoriteVCSections.firstIndex(where: {
////                if case .favorites = $0 { return true }
////                return false
////            }) {
////                self.tableView.reloadSections(IndexSet(integer: index), with: .automatic)
////            }
////        }
//    }
//}
//
//// MARK: - Business Logic
//extension FavoritesVC {
//    private func updateSections(with rootModel: RootModel) {
//        
//        let storedTopPicks = ordersService.fetchTopPicks()
//        
//        tableView.favoriteVCSections = [
//            .favorites(model: storedTopPicks),
//            .findYourNextFavorite(model: rootModel.topPicks)
//        ]
//        //DispatchQueue.main.async {
//            self.tableView.reloadData()
//       // }
//    }
//    
//    private func loadSecondSection() {
//        loader.loadProducts { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success(let products):
//                self.updateSections(with: products)
////                self.tableView.reloadData()
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//}
//
//// MARK: - Layout
//extension FavoritesVC {
//    
//    private func setupView() {
//        view.addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//       
//
//        //tableView.rowHeight = UITableView.automaticDimension
//        //tableView.estimatedRowHeight = 250
//    }
//    
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//}
//
//
//
//
//
//
//
//
//
//
//
////final class FavoritesVC: UIViewController {
////
////    private let loader: ILoader
////    private let ordersService: OrdersServiceProtocol
////    private var tableView = FavoritesTableView()
////    private var favoriteVCTableViewCell = FavoriteVCTableViewCell()
////
////
////
////    private var isEditingMode = false
////
////    private var favoriteCell: FavoriteVCTableViewCell?
////
////
////    init(loader: ILoader, ordersService: OrdersServiceProtocol = OrdersService()) {
////        self.loader = loader
////        self.ordersService = ordersService
////        super.init(nibName: nil, bundle: nil)
////    }
////
////    required init?(coder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        title = "Favorites"
////        navigationController?.navigationBar.prefersLargeTitles = true
//////        setupNavigationBar()
//////        setupView()
//////        setupConstraints()
//////        loadFirstSection()
//////        loadSecondSection()
//////        clearUserDefaults()
////
////    }
////
////    override func viewDidAppear(_ animated: Bool) {
////        super.viewDidAppear(animated)
//// //       loadFirstSection()
////        setupNavigationBar()
////        setupView()
////        setupConstraints()
////        loadSecondSection()
//////        tableView.reloadData()
////        // favoriteVCTableViewCell.updateCollectionViewHeight()
////
////    }
////
////    func clearUserDefaults() {
//// //       UserDefaults.standard.removeObject(forKey: "Products")
////        UserDefaults.standard.removeObject(forKey: "TopPicksKey")
////        UserDefaults.standard.synchronize()  // Это гарантирует, что данные будут немедленно удалены
////    }
////
////    private func setupNavigationBar() {
////
////        let rightButton = UIBarButtonItem(title: "Edit",
////                                          style: .plain,
////                                          target: self,
////                                          action: #selector(rightButtonTapped))
////
////        rightButton.tintColor = .gray
////        navigationItem.rightBarButtonItem = rightButton
////    }
////
////    @objc private func rightButtonTapped() {
////
////            isEditingMode.toggle() // Меняем состояние редактирования
////            tableView.isEditingMode = isEditingMode
//// //           tableView.reloadData() // Обновляем таблицу для передачи нового состояния
////            navigationItem.rightBarButtonItem?.title = isEditingMode ? "Done" : "Edit" // Меняем заголовок кнопки
//////            tableView.reloadData() // Обновляем таблицу для передачи нового состояния
////
//////            favoriteCell?.reloadCollectionViewData()
//////            tableView.reloadSections(IndexSet(integer: 1), with: .none)
//////        DispatchQueue.main.async {
//////            self.tableView.reloadData()
//////        }
////    }
////
////
////
////
////}
////
////// MARK: - Business Logic
////extension FavoritesVC {
////
//////    private func updateSections(with newSection: FavoritesTableView.FavoriteVCSections) {
//////
//////        if let index = tableView.favoriteVCSections.firstIndex(where: {
//////
//////            if case .favorites = $0,
//////               case .favorites = newSection { return true }
//////
//////            if case .findYourNextFavorite = $0,
//////               case .findYourNextFavorite = newSection { return true }
//////
//////            return false
//////        })
//////        {
//////            tableView.favoriteVCSections[index] = newSection
//////        } else
//////        {
//////            tableView.favoriteVCSections.append(newSection)
//////        }
//////
//////        DispatchQueue.main.async {
//////            self.tableView.reloadData()
//////        }
//////
//////
//////    }
///////
//////    private func updateSections(with newSection: FavoritesTableView.FavoriteVCSections) {
//////  //      print("Updating sections with new data: \(newSection)")  // Логируем обновление
//////
//////        if let index = tableView.favoriteVCSections.firstIndex(where: {
//////            if case .favorites = $0, case .favorites = newSection { return true }
//////            if case .findYourNextFavorite = $0, case .findYourNextFavorite = newSection { return true }
//////            return false
//////        }) {
//////            tableView.favoriteVCSections[index] = newSection
//////        } else {
//////            tableView.favoriteVCSections.append(newSection)
//////        }
//////
//////        DispatchQueue.main.async {
////////            print("Reloading table view data...")  // Логируем перезагрузку
////////            print("favoriteVCSections after update: \(self.tableView.favoriteVCSections)")  // Логируем текущее состояние
//////            self.tableView.reloadData()
//////        }
//////    }
///////
////    private func updateSections(with rootModel: RootModel) {
////
////    let storedTopPicks = ordersService.fetchTopPicks()
////
////    tableView.favoriteVCSections = [
////        .favorites(model: storedTopPicks),
////        .findYourNextFavorite(model: rootModel.topPicks)
////    ]
////
////        DispatchQueue.main.async {
////            self.tableView.reloadData()
////        }
////    }
////
////
//////    private func updateFirstSection(with topPicks: [TopPickModel]) {
//////        let section = FavoritesTableView.FavoriteVCSections.favorites(model: topPicks)
//////        updateSections(with: section)
//////
//////    }
////
//////    private func updateSecondSection(with topPicks: RootModel) {
//////        let section = FavoritesTableView.FavoriteVCSections.findYourNextFavorite(model: topPicks.topPicks)
//////        updateSections(with: section)
//////
//////    }
////
////
//////    private func loadFirstSection() {
//////
////////        let storedTopPicks = ordersService.fetchTopPicks()
////////        self.updateSections(with: storedTopPicks)
//////    }
////
////    private func loadSecondSection() {
////        loader.loadData { [weak self] result in
////            guard let self = self else { return }
////            switch result {
////            case .success(let products):
////                self.updateSections(with: products)
////
////            case .failure(let error):
////                print(error)
////            }
////        }
////    }
////}
////
////// MARK: - Layout
////extension FavoritesVC {
////
////    private func setupView() {
////        view.addSubview(tableView)
////        tableView.translatesAutoresizingMaskIntoConstraints = false
////
////        tableView.estimatedRowHeight = 200
////        tableView.rowHeight = UITableView.automaticDimension
////    }
////
////    private func setupConstraints() {
////        NSLayoutConstraint.activate([
////            tableView.topAnchor.constraint(equalTo: view.topAnchor),
////            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
////            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
////            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
////        ])
////    }
////}
//
//
//
//
//
//
//
////func clearAllUserDefaults() {
////    // Получаем идентификатор приложения
////    if let domain = Bundle.main.bundleIdentifier {
////        // Удаляем все данные для этого приложения в UserDefaults
////        UserDefaults.standard.removePersistentDomain(forName: domain)
////        UserDefaults.standard.synchronize()  // Принудительное сохранение изменений
////    }
////}
////
////func printAllUserDefaults() {
////    for (key, _) in UserDefaults.standard.dictionaryRepresentation() {
////        print(key) // Печать всех ключей
////    }
////}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////struct RootModel2: Decodable {
////    let product: [Product]
////}
////
////struct TopPickModel: Codable {
////    let id: Int
////    let image: String
////    let description: String
////    let type: String
////    let price: String
////    let categories: [Categories]?
////    let listCategories: [ListModel]?
////    let categoryName: String?
////    let detailButtonsName: DetailButtonsModel?
////    let pagecontrolModel: [PageControlModel]?
//////    var count: Int
////}
////
////struct Product: Codable {
////    let id: Int
////    let name: String
////    let price: Int
////    var count: Int
////}
////
////struct MockData {
////    static let products: [Product] = [
////        Product(id: 1, name: "Pro", price: 100, count: 1),
////        Product(id: 2, name: "Pro 2", price: 200, count: 2),
////        Product(id: 3, name: "Pro 5", price: 300, count: 3)
////    ]
////}
////
////
////// MARK: - ILoader2
////protocol ILoader2 {
////    func loadData(completion: @escaping (Result<RootModel2, Error>) -> Void)
////}
////
////class MockLoader: ILoader2 {
////    func loadData(completion: @escaping (Result<RootModel2, Error>) -> Void) {
////        completion(.success(RootModel2(product: MockData.products)))
////    }
////}
//
//
//
////final class FavoritesVC: UIViewController {
////
////    private let loader: ILoader
////    private let ordersService: OrdersServiceProtocol
////    private var tableView = FavoritesTableView()
////    private var favoriteVCTableViewCell = FavoriteVCTableViewCell()
////
////    init(loader: ILoader, ordersService: OrdersServiceProtocol = OrdersService()) {
////        self.loader = loader
////        self.ordersService = ordersService
////        super.init(nibName: nil, bundle: nil)
////    }
////
////    required init?(coder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        title = "Favorites"
////        navigationController?.navigationBar.prefersLargeTitles = true
////        setupView()
////        setupConstraints()
//////        loadTopPickProducts()
//////        loadProducts()
////
//////        clearUserDefaults()
//////        clearAllUserDefaults()
////
//////        printAllUserDefaults()
////    }
////
////    override func viewDidAppear(_ animated: Bool) {
////        super.viewDidAppear(animated)
////        setupView()
////        setupConstraints()
////        loadTopPickProducts()
////        loadProducts()
//////        tableView.reloadData()
//////        favoriteVCTableViewCell.updateCollectionViewHeight() // Обновляем высоту CollectionView
////    }
////
//////    override func viewWillAppear(_ animated: Bool) {
//////        super.viewWillAppear(animated)
////////        setupView()
////////        setupConstraints()
//////        loadTopPickProducts()
//////        loadProducts()
//////        tableView.reloadData()
//////    }
////
////    func clearUserDefaults() {
////        UserDefaults.standard.removeObject(forKey: "Products")
////        UserDefaults.standard.removeObject(forKey: "TopPicksKey")
////        UserDefaults.standard.synchronize()  // Это гарантирует, что данные будут немедленно удалены
////    }
////
//////    func clearAllUserDefaults() {
//////        let domain = Bundle.main.bundleIdentifier
//////        UserDefaults.standard.removePersistentDomain(forName: domain!)
//////        UserDefaults.standard.synchronize()
//////    }
////
////    func printAllUserDefaults() {
////        for (key, _) in UserDefaults.standard.dictionaryRepresentation() {
////            print(key) // Печать всех ключей
////        }
////    }
////
//////    func printAllUserDefaults() {
//////        let allDefaults = UserDefaults.standard.dictionaryRepresentation()
//////        for (key, value) in allDefaults {
//////            print("\(key): \(value)")
//////        }
//////    }
////
////
////    func clearAllUserDefaults() {
////        // Получаем идентификатор приложения
////        if let domain = Bundle.main.bundleIdentifier {
////            // Удаляем все данные для этого приложения в UserDefaults
////            UserDefaults.standard.removePersistentDomain(forName: domain)
////            UserDefaults.standard.synchronize()  // Принудительное сохранение изменений
////        }
////
////        // Дополнительно, можно перезаписать UserDefaults, если это необходимо
////        UserDefaults.standard.removeObject(forKey: "Products")
////        UserDefaults.standard.removeObject(forKey: "TopPicksKey")
////        UserDefaults.standard.synchronize()
////    }
////}
////
////// MARK: - Business Logic
////extension FavoritesVC {
////
////    private func updateFavoritesSection(with newSection: FavoritesTableView.FavoriteVCSections) {
////        if let index = tableView.favoritesDataModel.firstIndex(where: {
////            if case .favorites = $0,
////               case .favorites = newSection { return true }
////            if case .findYourNextFavorite = $0,
////               case .findYourNextFavorite = newSection { return true }
////            return false
////        }) {
////            tableView.favoritesDataModel[index] = newSection
////        } else {
////            tableView.favoritesDataModel.append(newSection)
////        }
////
////        DispatchQueue.main.async {
////            self.tableView.reloadData()
////        }
////    }
////
////    private func updateDataModel(with topPicks: RootModel) {
////        let section = FavoritesTableView.FavoriteVCSections.findYourNextFavorite(model: topPicks.topPicks)
////        updateFavoritesSection(with: section)
////    }
////
////    private func updateDataModels(with topPicks: [TopPickModel]) {
////        let section = FavoritesTableView.FavoriteVCSections.favorites(model: topPicks)
////        updateFavoritesSection(with: section)
////    }
////
////    private func loadTopPickProducts() {
////        let storedTopPicks = ordersService.fetchTopPicks()
//////        if storedTopPicks.isEmpty {
//////            loader.loadData { [weak self] result in
//////                guard let self = self else { return }
//////                switch result {
//////                case .success(let rootModel):
//////                    let topPicks = rootModel.topPicks.map {
//////                        TopPickModel(
//////                            id: $0.id,
//////                            image: $0.image,
//////                            description: $0.description,
//////                            type: "Example Type",
//////                            price: "\($0.price)",
//////                            categories: nil,
//////                            listCategories: nil,
//////                            categoryName: nil,
//////                            detailButtonsName: nil,
//////                            pagecontrolModel: nil
//////                        )
//////                    }
//////                    self.ordersService.saveTopPicks(topPicks)
//////                    self.updateDataModels(with: topPicks)
//////                case .failure(let error):
//////                    print("Failed to load data: \(error)")
//////                }
//////            }
//////        } else {
////            self.updateDataModels(with: storedTopPicks)
//// //       }
////
////
////        }
////
////
////    func loadProducts() {
////        loader.loadData { [weak self] result in
////            guard let self = self else { return }
////            switch result {
////            case .success(let products):
////                self.updateDataModel(with: products)
////            case .failure(let error):
////                print(error)
////            }
////        }
////    }
////}
////
////// MARK: - Layout
////extension FavoritesVC {
////
////    private func setupView() {
////        view.addSubview(tableView)
////        tableView.translatesAutoresizingMaskIntoConstraints = false
////    }
////
////    private func setupConstraints() {
////        NSLayoutConstraint.activate([
////            tableView.topAnchor.constraint(equalTo: view.topAnchor),
////            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
////            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
////            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
////        ])
////    }
////}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////final class FavoritesVC: UIViewController {
////
//////    private let loader: ILoader2
////    private let loader: ILoader
////
////    private let ordersService: OrdersServiceProtocol
////    private var tableView = FavoritesTableView()
////
//////    init(loader: ILoader2, ordersService: OrdersServiceProtocol = OrdersService()) {
////    init(loader: ILoader, ordersService: OrdersServiceProtocol = OrdersService()) {
////        self.loader = loader
////        self.ordersService = ordersService
////        super.init(nibName: nil, bundle: nil)
////    }
////
////    required init?(coder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        title = "Favorites"
////        navigationController?.navigationBar.prefersLargeTitles = true
////        setupView()
////        setupConstraints()
////        loadTopPickProducts()
////        loadProducts()
////    }
////
//////    override func viewDidAppear(_ animated: Bool) {
//////        super.viewDidAppear(animated)
//////        loadTopPickProducts()
//////    }
////}
////
////// MARK: - Business Logic
////extension FavoritesVC {
////
////    private func updateDataModels(with topPicks: [TopPickModel]) {
////   //     print("Loaded Top Picks: \(topPicks)") // Выводим данные
////        tableView.favoritesDataModel = [
////            .favorites(model: topPicks),
//// //           .findYourNextFavorite(model: topPicks)
////        ]
////        DispatchQueue.main.async {
////            self.tableView.reloadData()
////        }
////    }
////
////    private func updateDataModel(with topPicks: RootModel) {
////   //     print("Loaded Top Picks: \(topPicks)") // Выводим данные
////        tableView.favoritesDataModel = [
//// //           .favorites(model: topPicks.topPicks),
////            .findYourNextFavorite(model: topPicks.topPicks)
////        ]
////        DispatchQueue.main.async {
////            self.tableView.reloadData()
////        }
////    }
////
//////    private func loadTopPickProducts() {
//////        let storedTopPicks = ordersService.fetchTopPicks() // Загружаем сохраненные TopPickModel
//////
//////        if storedTopPicks.isEmpty {
//////            loader.loadData { [weak self] result in
//////                guard let self = self else { return }
//////                switch result {
//////                case .success(let rootModel):
//////                    let topPicks = rootModel.product.map {
//////                        TopPickModel(
//////                            id: $0.id,
//////                            image: "image.jpg",
//////                            description: $0.name,
//////                            type: "Type Example",
//////                            price: "\($0.price)",
//////                            categories: nil,
//////                            listCategories: nil,
//////                            categoryName: nil,
//////                            detailButtonsName: nil,
//////                            pagecontrolModel: nil
//////                        )
//////                    }
//////                    // Сохраняем массив TopPickModel в UserDefaults
//////                    self.ordersService.saveTopPicks(topPicks)
//////                    self.updateDataModels(with: topPicks)
//////                case .failure(let error):
//////                    print("Failed to load data: \(error)")
//////                }
//////            }
//////        } else {
//////            self.updateDataModels(with: storedTopPicks)
//////        }
//////    }
////
////
////
////
////
////
////
////
////
////
////
////
////
////    private func loadTopPickProducts() {
////        let storedTopPicks = ordersService.fetchTopPicks()
//// //       print("Stored Top Picks: \(storedTopPicks)") // Загружаем данные из хранилища
////
////        if storedTopPicks.isEmpty {
////            loader.loadData { [weak self] result in
////                guard let self = self else { return }
////                switch result {
////                case .success(let rootModel):
////
////                    let topPicks = rootModel.topPicks.map {
////                        TopPickModel(
////                            id: $0.id,
////                            image: "image.jpg",
////                            description: $0.description,
////                            type: "Example Type",
////                            price: "\($0.price)",
////                            categories: nil,
////                            listCategories: nil,
////                            categoryName: nil,
////                            detailButtonsName: nil,
////                            pagecontrolModel: nil
//// //                           count: $0.count
////                        )
////                    }
////
//// //                   self.ordersService.addTopPick(topPicks)
////                    self.ordersService.saveTopPicks(topPicks) // Сохраняем данные
////                    self.updateDataModels(with: topPicks) // Обновляем UI
////                case .failure(let error):
////                    print("Failed to load data: \(error)")
////                }
////            }
////        } else {
////            self.updateDataModels(with: storedTopPicks)
////        }
////    }
////}
////
////
////
//////MARK: - Business Logic
////extension FavoritesVC {
////
////    private func updateDataModels(with products: RootModel) {
////        tableView.favoritesDataModel =
////        [
////            .findYourNextFavorite(model: products.topPicks)
////        ]
////        DispatchQueue.main.async {
////            self.tableView.reloadData()
////        }
////    }
////
////    func loadProducts() {
////        loader.loadData { [weak self] result in
////            guard let self = self else { return }
////            switch result {
////
////            case .success(let products):
////                self.updateDataModel(with: products)
////
////            case .failure(let error):
////                print(error)
////            }
////        }
////    }
////}
////
////// MARK: - Layout
////extension FavoritesVC {
////
////    private func setupView() {
////        view.addSubview(tableView)
////        tableView.translatesAutoresizingMaskIntoConstraints = false
////    }
////
////    private func setupConstraints() {
////        NSLayoutConstraint.activate([
////            tableView.topAnchor.constraint(equalTo: view.topAnchor),
////            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
////            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
////            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
////        ])
////    }
////}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//// With MockData
//
////struct RootModel2: Decodable {
////    let product: [Product]
////}
////
////struct TopPickModel: Decodable, Encodable {
////    let id: Int
////    let image: String
////    let description: String
////    let type: String
////    let price: String
////    let categories: [Categories]?
////    let listCategories: [ListModel]?
////    let categoryName: String?
////    let detailButtonsName: DetailButtonsModel?
////    let pagecontrolModel: [PageControlModel]?
////}
////
////struct Product: Codable {
////    let id: Int
////    let name: String
////    let price: Int
////    var count: Int
////}
////
////struct MockData {
////    static let products: [Product] = [
////        Product(id: 1, name: "Pro", price: 100, count: 1),
////        Product(id: 2, name: "Pro 2", price: 200, count: 2),
////        Product(id: 3, name: "Pro 5", price: 300, count: 3)
////    ]
////}
////
////
////// MARK: - ILoader2
////protocol ILoader2 {
////    func loadData(completion: @escaping (Result<RootModel2, Error>) -> Void)
////}
////
////class MockLoader: ILoader2 {
////    func loadData(completion: @escaping (Result<RootModel2, Error>) -> Void) {
////        completion(.success(RootModel2(product: MockData.products)))
////    }
////}
////
////final class FavoritesVC: UIViewController {
////
////    private let loader: ILoader2
////    private let ordersService: OrdersServiceProtocol
////    private var tableView = FavoritesTableView()
////
////    init(loader: ILoader2, ordersService: OrdersServiceProtocol = OrdersService()) {
////        self.loader = loader
////        self.ordersService = ordersService
////        super.init(nibName: nil, bundle: nil)
////    }
////
////    required init?(coder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        title = "Favorites"
////        navigationController?.navigationBar.prefersLargeTitles = true
////        setupView()
////        setupConstraints()
//////        loadProducts()
////        loadTopPickProducts()
////    }
////}
////
////// MARK: - Business Logic
////extension FavoritesVC {
////
//////    private func updateDataModels(with products: RootModel2) {
//////        tableView.favoritesDataModel = [
//////            .favorites(model: products.product)
//////
//////        ]
//////        DispatchQueue.main.async {
//////            self.tableView.reloadData()
//////        }
//////    }
////
////    private func updateDataModels(with topPicks: [TopPickModel]) {
////        tableView.favoritesDataModel = [
////            .favorites(model: topPicks)
////        ]
////        DispatchQueue.main.async {
////            self.tableView.reloadData()
////        }
////    }
////
//////    private func loadProducts() {
//////        let storedProducts = ordersService.fetch()
//////
//////        if storedProducts.isEmpty {
//////            // Используем MockData
//////            let mockRootModel = RootModel2(product: MockData.products)
//////            self.updateDataModels(with: mockRootModel)
//////        } else {
//////            // Преобразование сохраненных данных
//////            let topPicks = storedProducts.map { Product(id: $0.id, name: $0.name, price: $0.price, count: $0.count) }
//////            let rootModel = RootModel2(product: topPicks)
//////            self.updateDataModels(with: rootModel)
//////        }
//////    }
////
////
////
////
////
////
////    private func loadTopPickProducts() {
////        let storedTopPicks = ordersService.fetchTopPicks() // Загружаем сохраненные TopPickModel
////
////        if storedTopPicks.isEmpty {
////            // Если данных нет, используем MockData или загружаем данные с сервера
////            loader.loadData { [weak self] result in
////                guard let self = self else { return }
////                switch result {
////                case .success(let rootModel):
////                    // Преобразуем данные сервера в TopPickModel
////                    let topPicks = rootModel.product.map {
////                        TopPickModel(
////                            id: $0.id,
////                            image: "image.jpg",
////                            description: $0.name,
////                            type: "Type Example",
////                            price: "\($0.price)",
////                            categories: nil,
////                            listCategories: nil,
////                            categoryName: nil,
////                            detailButtonsName: nil,
////                            pagecontrolModel: nil
////                        )
////                    }
////                    // Сохраняем массив TopPickModel в UserDefaults
////                    self.ordersService.saveTopPicks(topPicks)
////                    self.updateDataModels(with: topPicks)
////                case .failure(let error):
////                    print("Failed to load data: \(error)")
////                }
////            }
////        } else {
////            // Если данные есть, обновляем модель
////            self.updateDataModels(with: storedTopPicks)
////        }
////    }
//    
/////
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
////    private func loadTopPickProducts() {
////        let storedTopPicks = ordersService.fetchTopPicks() // Загружаем сохраненные TopPickModel
////
////        if storedTopPicks.isEmpty {
////            // Если данных нет, используем MockData или загружаем данные с сервера
////            loader.loadData { [weak self] result in
////                guard let self = self else { return }
////                switch result {
////                case .success(let rootModel):
////                    // Здесь преобразуем данные сервера в TopPickModel (если необходимо)
////                    let topPicks = rootModel.product.map {
////                        TopPickModel(
////                            id: $0.id,
////                            image: "image.jpg",
////                            description: $0.name,
////                            type: "Type Example",
////                            price: "\($0.price)",
////                            categories: nil,
////                            listCategories: nil,
////                            categoryName: nil,
////                            detailButtonsName: nil,
////                            pagecontrolModel: nil
////                        )
////                    }
////                    // Сохраняем в сервис
////                    self.ordersService.saveTopPicks(topPicks)
////                    self.updateDataModels(with: topPicks)
////                case .failure(let error):
////                    print("Failed to load data: \(error)")
////                }
////            }
////        } else {
////            // Если данные есть, обновляем модель
////            self.updateDataModels(with: storedTopPicks)
////        }
////    }
////}
//
////// MARK: - Layout
////extension FavoritesVC {
////
////    private func setupView() {
////        view.addSubview(tableView)
////    }
////
////    private func setupConstraints() {
////        NSLayoutConstraint.activate([
////            tableView.topAnchor.constraint(equalTo: view.topAnchor),
////            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
////            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
////            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
////        ])
////    }
////}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////final class FavoritesVC: UIViewController {
////
////    private let loader: ILoader2
////    private let ordersService: OrdersServiceProtocol
////    private var tableView = FavoritesTableView()
////
////    init(loader: ILoader2, ordersService: OrdersServiceProtocol = OrdersService()) {
////        self.loader = loader
////        self.ordersService = ordersService
////        super.init(nibName: nil, bundle: nil)
////    }
////
////    required init?(coder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        title = "Favorites"
////        navigationController?.navigationBar.prefersLargeTitles = true
////        setupView()
////        setupConstraints()
////        loadProducts()
////    }
////}
////
//////MARK: - Business Logic
////extension FavoritesVC {
////
////    private func updateDataModels(with products: RootModel2) {
////        tableView.favoritesDataModel =
////        [
////            .favorites(model: products.product)
////        ]
////        DispatchQueue.main.async {
////            self.tableView.reloadData()
////        }
////    }
////
////    private func loadProducts() {
////        let storedProducts = ordersService.fetch()
////        if !storedProducts.isEmpty {
////            // Преобразование сохраненных продуктов в нужный формат
////            let topPicks = storedProducts.map { Product(id: $0.id, name: $0.name, price: $0.price, count: $0.count) }
////
////            let rootModel = RootModel2(
////                product: topPicks
////            )
////
////            self.updateDataModels(with: rootModel)
////        } else {
////            loader.loadData { [weak self] result in
////                guard let self = self else { return }
////                switch result {
////                case .success(let products):
////                    self.updateDataModels(with: products)
////                case .failure(let error):
////                    print("Error loading data: \(error)")
////                }
////            }
////        }
////    }
////}
////
////// MARK: - Layout
////extension FavoritesVC {
////
////    private func setupView() {
////        view.addSubview(tableView)
////    }
////
////    private func setupConstraints() {
////        NSLayoutConstraint.activate([
////            tableView.topAnchor.constraint(equalTo: view.topAnchor),
////            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
////            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
////            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
////        ])
////    }
////}
////
////class FavoritesTableView: UITableView {
////
////    var favoritesDataModel: [FavoriteVCSections] = []
////
////    override init(frame: CGRect, style: UITableView.Style) {
////        super.init(frame: frame, style: style)
////        commonInit()
////    }
////
////    required init?(coder: NSCoder) {
////        super.init(coder: coder)
////        fatalError("init(coder:) has not been implemented")
////    }
////
////    private func commonInit() {
////        translatesAutoresizingMaskIntoConstraints = false
////
////        delegate = self
////        dataSource = self
////
////        separatorStyle = .none
////        allowsSelection = true
////
////        registerCell(OrthogonalContainerCell.self)
////        registerCell(FavoriteVCTableViewCell.self)
////    }
////}
////
////// MARK: - UITableViewDelegate
////extension FavoritesTableView: UITableViewDelegate {}
////
////// MARK: - UITableViewDataSource
////extension FavoritesTableView: UITableViewDataSource {
////
////    enum FavoriteVCSections {
////        case favorites(model: [Product])
////        case findYourNextFavorite(model1: [TopPickModel], header: UniversalHeaderModel)
////    }
////
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        let sections = favoritesDataModel[indexPath.section]
////        switch sections {
////        case .favorites:
////            return 450
////        case .findYourNextFavorite:
////            return 350
////        }
////    }
////
////    func numberOfSections(in tableView: UITableView) -> Int {
////        return favoritesDataModel.count
////    }
////
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return 1
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let sections = favoritesDataModel[indexPath.section]
////
////        switch sections {
////        case .favorites(let model):
////            let cell = tableView.dequeuCell(indexPath) as FavoriteVCTableViewCell
////            cell.update(model)
////            return cell
////
////        case .findYourNextFavorite(let model, _):
////            let cell = tableView.dequeuCell(indexPath) as OrthogonalContainerCell
////            cell.update(with: .topPicks(models: model), collectionViewHeight: 300)
////            return cell
////        }
////    }
////}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////final class FavoritesVC: UIViewController {
////
////    private let loader: ILoader
////    private var tableView = FavoritesTableView()
////
////    init(loader: ILoader) {
////        self.loader = loader
////        super.init(nibName: nil, bundle: nil)
////    }
////
////    required init?(coder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
////
//////    required init?(coder: NSCoder) {
//////        self.topPicksLoader = TopPicksLoader()
//////        super.init(coder: coder)
//////    }
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        title = "Favorites"
////        navigationController?.navigationBar.prefersLargeTitles = true
////        setupView()
////        setupConstraints()
////        loadProducts()
////    }
////}
////
////
//////MARK: - Business Logic
////extension FavoritesVC {
////
////    private func updateDataModels(with products: RootModel) {
////        tableView.favoritesDataModel =
////        [
////            .favorites(model: products.topPicks, header: products.headers.universalHeaderModel),
////            .findYourNextFavorite(model1: products.topPicks, header: products.headers.universalHeaderModel)
////        ]
////        DispatchQueue.main.async {
////            self.tableView.reloadData()
////        }
////    }
////
////    func loadProducts() {
////        loader.loadData { [weak self] result in
////            guard let self = self else { return }
////            switch result {
////
////            case .success(let products):
////                self.updateDataModels(with: products)
////
////            case .failure(let error):
////                print(error)
////            }
////        }
////    }
////}
////
////// MARK: - Layout
////extension FavoritesVC {
////
////    func setupView() {
////        view.addSubview(tableView)
////    }
////
////    func setupConstraints() {
////        NSLayoutConstraint.activate([
////            tableView.topAnchor.constraint(equalTo: view.topAnchor),
////            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
////            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
////            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
////        ])
////    }
////}
//
//
//
//import UIKit
//
//class FavoritesTableView: UITableView {
//    
//    public var isEditingMode: Bool = false
//    
//    private var favoriteVCTableViewCell = FavoriteVCTableViewCell()
//
//    var favoriteVCSections: [FavoriteVCSections] = []
//    
////    var favoriteVCSections: [FavoriteVCSections] = [] {
////        didSet {
////            self.reloadData()
////
////        }
////    }
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
//    private func commonInit() {
//        translatesAutoresizingMaskIntoConstraints = false
//        delegate = self
//        dataSource = self
// //       separatorStyle = .none
//        allowsSelection = true
//        
//        registerCell(FavoriteVCTableViewCell.self)
//        registerCell(OrthogonalContainerCell.self)
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
//        case favorites(model: [TopPickModel])
//        case findYourNextFavorite(model: [TopPickModel])
//    }
//    
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        return 450
////    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return favoriteVCSections.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let sections = favoriteVCSections[indexPath.section]
//        
//        switch sections {
//        case .favorites(let model):
//            
//            let cell = tableView.dequeuCell(indexPath) as FavoriteVCTableViewCell
//            cell.update(model, isEditing: isEditingMode)
//  //          cell.updateCollectionViewHeight()
//            return cell
//       
//        case .findYourNextFavorite(model: let model):
//            
//            let cell = tableView.dequeuCell(indexPath) as OrthogonalContainerCell
//            let sectionHeight: CGFloat = 290
//            cell.update(dataType: .topPicks(model), sectionHeight: sectionHeight)
//            
//            return cell
//        }
//    }
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//// MARK: - Mock OrdersService
////class MockOrdersService: OrdersServiceProtocol {
////    func fetch() -> [Product] {
////        return MockData.products
////    }
////}
//
//// MARK: - Protocols
////protocol OrdersServiceProtocol {
////    func fetch() -> [Product]
////}
////
////class OrdersService: OrdersServiceProtocol {
////    func fetch() -> [Product] {
////        return [] // Реальная реализация сервиса
////    }
////}
//
//
//
//
//
//
//
//
//
//
//
////class FavoritesTableView: UITableView {
////
////    var favoritesDataModel: [FavoriteVCSections] = []
////
////    override init(frame: CGRect, style: UITableView.Style) {
////        super.init(frame: frame, style: style)
////        commonInit()
////    }
////
////    required init?(coder: NSCoder) {
////        super.init(coder: coder)
////        fatalError("init(coder:) has not been implemented")
////    }
////
////    func commonInit() {
////        translatesAutoresizingMaskIntoConstraints = false
////
////        delegate = self
////        dataSource = self
////
////        separatorStyle = .none
////        allowsSelection = true
////
////        registerCell(OrthogonalContainerCell.self)
////        registerCell(FavoriteVCTableViewCell.self)
////    }
////}
////
////// MARK: - UITableViewDelegate
////extension FavoritesTableView: UITableViewDelegate {}
////
////// MARK: - UITableViewDataSource
////extension FavoritesTableView: UITableViewDataSource {
////
////    enum FavoriteVCSections {
////        case favorites(model: [TopPickModel], header: UniversalHeaderModel)
////        case findYourNextFavorite(model1: [TopPickModel], header: UniversalHeaderModel)
////    }
////
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        let sections = favoritesDataModel[indexPath.section]
////        switch sections {
////        case .favorites:
////            return 450
////        case .findYourNextFavorite(_, _):
////            return 350
////        }
////    }
////
////    func numberOfSections (in tableView: UITableView) -> Int {
////        return favoritesDataModel.count
////    }
////
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return 1
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let sections = favoritesDataModel[indexPath.section]
////
////        switch sections {
////
////        case .favorites(let model, header: _):
////            let cell = tableView.dequeuCell(indexPath) as FavoriteVCTableViewCell
////            cell.update(model)
////            return cell
////
////        case .findYourNextFavorite(model1: let model, header: let header):
////            let cell = tableView.dequeuCell(indexPath) as OrthogonalContainerCell
//////            cell.update(model)
//////            cell.updateHeader(header)
////            return cell
////        }
////    }
////}
