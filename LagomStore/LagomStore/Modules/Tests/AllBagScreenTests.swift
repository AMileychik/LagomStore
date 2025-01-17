//
//  AllBagScreenTests.swift
//  LagomStore
//
//  Created by Александр Милейчик on 1/6/25.
//

import Foundation

// 1.

//class BagVC: UIViewController {
//    
//    private let loader: IProductsLoader
//    private let bagOrderService: OrdersServiceProtocol
//    private var tableView = BagTableView()
//    private var bagVCData: [TopPickModel] = []
//    private let buttonView = UIView()
//    private let leftButton = UIButton(type: .system)
//    private let rightButton = UIButton(type: .system)
//    
//    init(loader: IProductsLoader, bagOrdersService: OrdersServiceProtocol = OrdersService()) {
//        self.loader = loader
//        self.bagOrderService = bagOrdersService
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Bag"
//        navigationController?.navigationBar.prefersLargeTitles = true
//        setupViews()
//        setupConstraints()
//  //      tableView.bagVCData = bagVCData
//        loadProducts()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        loadProducts()
//    }
//    
//
//}
//
//// MARK: - Layout
//extension BagVC {
//    
//    func setupViews() {
//        view.addSubview(tableView)
//        view.addSubview(buttonView)
//        
//        // Настройка buttonView
//        buttonView.backgroundColor = .white
//        buttonView.addSubview(leftButton)
//        buttonView.addSubview(rightButton)
//        
//        // Настройка кнопок
//        leftButton.setTitle("Левая", for: .normal)
//        rightButton.setTitle("Правая", for: .normal)
//        
//        leftButton.backgroundColor = .systemBlue
//        leftButton.setTitleColor(.white, for: .normal)
//        rightButton.backgroundColor = .systemGreen
//        rightButton.setTitleColor(.white, for: .normal)
//        
//        leftButton.layer.cornerRadius = 10
//        rightButton.layer.cornerRadius = 10
//    }
//    
//    func setupConstraints() {
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        buttonView.translatesAutoresizingMaskIntoConstraints = false
//        leftButton.translatesAutoresizingMaskIntoConstraints = false
//        rightButton.translatesAutoresizingMaskIntoConstraints = false
//        
////        tableView.rowHeight = UITableView.automaticDimension
////        tableView.estimatedRowHeight = 300
////        tableView.beginUpdates()
////        tableView.endUpdates()
//        
////        tableView.estimatedRowHeight = 300
// //       tableView.rowHeight = UITableView.automaticDimension
////
//        
//
//        
//
//        
//        NSLayoutConstraint.activate([
//            // Констрейнты для таблицы
//            
// 
//            
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: buttonView.topAnchor),
//            
//            // Констрейнты для buttonView
//            buttonView.heightAnchor.constraint(equalToConstant: 80),
//            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            
//            // Констрейнты для левой кнопки
//            leftButton.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 16),
//            leftButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
//            leftButton.heightAnchor.constraint(equalToConstant: 30),
//            leftButton.widthAnchor.constraint(equalToConstant: 100),
//            
//            // Констрейнты для правой кнопки
//            rightButton.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: -16),
//            rightButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
//            rightButton.heightAnchor.constraint(equalToConstant: 30),
//            rightButton.widthAnchor.constraint(equalToConstant: 100)
//        ])
//    }
//}
//
//// MARK: - Data Loading
//extension BagVC {
//    private func updateDataModels(with products: RootModel) {
//        let storedTopPicks = bagOrderService.fetchTopPicks()
//        tableView.bagSections = [
//            .firstSection(products.promotionModel),
//            .secondSection(storedTopPicks),
//            .thirdSection(products.topPicks)
//        ]
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
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
//
//
//
//
//
//
//
//
//






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


//2.

//import UIKit
//
//class BagTableView: UITableView {
//    
//    
//    var rowHeights: [CGFloat] = []
//
//    
//    var firstSectionData: [PromotionModel] = []
//    var bagVCData: [TopPickModel] = []
//    var thirdSectionData: [TopPickModel] = []
//    
//    //   var bagSections: [BagSections]  = []
//    
//    var bagSections: [BagSections] {
//        get {
//            return [
//                .firstSection(firstSectionData),
//                .secondSection(bagVCData),
//                .thirdSection(thirdSectionData)
//            ]
//        }
//        set {
//            for section in newValue {
//                switch section {
//                case .firstSection(let data):
//                    firstSectionData = data
//                case .secondSection(let data):
//                    bagVCData = data
//                case .thirdSection(let data):
//                    thirdSectionData = data
//                }
//            }
//        }
//    }
//    
//    override init(frame: CGRect, style: UITableView.Style) {
//        super.init(frame: frame, style: style)
//        commonInit()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func commonInit() {
//        delegate = self
//        dataSource = self
//        //       separatorStyle = .none
//        allowsSelection = false
//        
//        //        tableView.rowHeight = UITableView.automaticDimension
//        estimatedRowHeight = 425
//        //        tableView.beginUpdates()
//        //        tableView.endUpdates()
//                
//        //        tableView.estimatedRowHeight = 300
//        rowHeight = UITableView.automaticDimension
//        
//        registerCell(TemporaryPromotionCell.self)
//        registerCell(OrdersCell.self)
//        registerCell(TVPlusCVCell.self)
//    }
//    
//}
//
//// MARK: - UITableViewDataSource
//extension BagTableView: UITableViewDataSource {
//    
//    enum BagSections {
//        case firstSection([PromotionModel])
//        case secondSection([TopPickModel])
//        case thirdSection([TopPickModel])
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch bagSections[section] {
//            
//        case .firstSection:
////            return 1
//            return firstSectionData.count
//        case .secondSection:
//            return bagVCData.count
//        case .thirdSection:
//            return 1
//        }
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return bagSections.count
//    }
//    
//    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    //        let sectionData = bagSections[indexPath.section]
//    //        switch sectionData {
//    //
//    //        case .firstSection:
//    //            return 200
//    //        case .secondSection:
//    //            return 200
//    //        case .thirdSection:
//    //            return 300
//    //        }
//    //    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let sectionData = bagSections[indexPath.section]
//        switch sectionData {
//            
//        case .firstSection(let model):
//            
//            let cell = tableView.dequeuCell(indexPath) as TemporaryPromotionCell
//            let model = model[indexPath.item]
//            cell.update(model)
//            return cell
//            
//        case .secondSection(let model):
//            
//            let cell = tableView.dequeuCell(indexPath) as OrdersCell
//            let model = model[indexPath.row]
//            cell.update(model)
//            
//            return cell
//            
//        case .thirdSection(let model):
//            let cell = tableView.dequeuCell(indexPath) as TVPlusCVCell
//            cell.updateData(model)
//            return cell
//        }
//    }
//}
//
//// MARK: - UITableViewDelegate
//extension BagTableView: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        // Проверяем, если секция не вторая, возвращаем nil
//        guard indexPath.section == 1 else {
//            return nil
//        }
//        
//        // Кнопка "Удалить"
//        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] _, _, completionHandler in
//            guard let self = self else { return }
//            guard indexPath.row < self.bagVCData.count else { return }
//            
//            let model = self.bagVCData[indexPath.row] // Извлекаем модель
//            self.didRequestDeleteItem(at: indexPath, model: model)
//            completionHandler(true)
//        }
//        deleteAction.backgroundColor = .red
//        
//        // Вторая кнопка с другим действием
//        let printAction = UIContextualAction(style: .normal, title: "Принт") { _, _, completionHandler in
//            print("Принт на строке \(indexPath.row)")
//            completionHandler(true)
//        }
//        printAction.backgroundColor = .blue
//        
//        // Возвращаем обе кнопки
//        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, printAction])
//        configuration.performsFirstActionWithFullSwipe = false // Отключаем полный свайп
//        return configuration
//    }
//}
//
////extension BagTableView {
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        let sections = bagSections[indexPath.section]
////
////        switch sections {
////
////        case .firstSection:
////            return 200
////        case .secondSection:
////
////            return UITableView.automaticDimension
////
////
////
////        case .thirdSection:
////            return 200
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
////class BagTableView: UITableView {
////
////    var firstSectionData: [PromotionModel] = []
////    var bagVCData: [TopPickModel] = []
////    var thirdSectionData: [TopPickModel] = []
////
////
////
//////    var bagSections: [BagSections] {
//////
//////        [
//////            .firstSection(firstSectionData),
//////            .secondSection(bagVCData),
//////            .thirdSection(thirdSectionData)
//////        ]
//////    }
////
////
////        var bagSections: [BagSections] {
////            get {
////                return [
////                    .firstSection(firstSectionData),
////                    .secondSection(bagVCData),
////                    .thirdSection(thirdSectionData)
////                ]
////            }
////            set {
////                for section in newValue {
////                    switch section {
////                    case .firstSection(let data):
////                        firstSectionData = data
////                    case .secondSection(let data):
////                        bagVCData = data
////                    case .thirdSection(let data):
////                        thirdSectionData = data
////                    }
////                }
////            }
////        }
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
////    override init(frame: CGRect, style: UITableView.Style) {
////        super.init(frame: frame, style: style)
////        commonInit()
////    }
////
////    required init?(coder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
////
////    func commonInit() {
////        delegate = self
////        dataSource = self
////
//// //       separatorStyle = .none
////        allowsSelection = false
////
////        registerCell(OrdersCell.self)
////        registerCell(ThankYouCell.self)
////        registerCell(TemporaryPromotionCell.self)
////
////        registerCell(TVPlusCVCell.self)
////    }
////
////}
////
////// MARK: - UITableViewDelegate
//////extension BagTableView: UITableViewDelegate {}
////
//////extension BagTableView: UITableViewDelegate {
//////    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//////        // Кнопка "Удалить"
//////        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] _, _, completionHandler in
//////            guard let self = self else { return }
//////            self.didRequestDeleteItem(at: indexPath)
//////            completionHandler(true)
//////        }
//////        deleteAction.backgroundColor = .red
//////
//////        // Вторая кнопка с другим действием
//////        let printAction = UIContextualAction(style: .normal, title: "Принт") { _, _, completionHandler in
//////            print("Принт на строке \(indexPath.row)")
//////            completionHandler(true)
//////        }
//////        printAction.backgroundColor = .blue
//////
//////        // Возвращаем обе кнопки
//////        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, printAction])
//////        configuration.performsFirstActionWithFullSwipe = false // Отключаем полный свайп
//////        return configuration
//////    }
//////}
////
//////extension BagTableView: UITableViewDelegate {
//////    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//////        // Кнопка "Удалить"
//////        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] _, _, completionHandler in
//////            guard let self = self else { return }
//////            guard indexPath.row < self.bagVCData.count else { return }
//////
//////            let model = self.bagVCData[indexPath.row] // Извлекаем модель
//////            self.didRequestDeleteItem(at: indexPath, model: model)
//////            completionHandler(true)
//////        }
//////        deleteAction.backgroundColor = .red
//////
//////        // Вторая кнопка с другим действием
//////        let printAction = UIContextualAction(style: .normal, title: "Принт") { _, _, completionHandler in
//////            print("Принт на строке \(indexPath.row)")
//////            completionHandler(true)
//////        }
//////        printAction.backgroundColor = .blue
//////
//////        // Возвращаем обе кнопки
//////        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, printAction])
//////        configuration.performsFirstActionWithFullSwipe = false // Отключаем полный свайп
//////        return configuration
//////    }
//////}
////
////
////extension BagTableView: UITableViewDelegate {
////    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
////        // Проверяем, если секция не вторая, возвращаем nil
////        guard indexPath.section == 1 else {
////            return nil
////        }
////
////        // Кнопка "Удалить"
////        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] _, _, completionHandler in
////            guard let self = self else { return }
////            guard indexPath.row < self.bagVCData.count else { return }
////
////            let model = self.bagVCData[indexPath.row] // Извлекаем модель
////            self.didRequestDeleteItem(at: indexPath, model: model)
////            completionHandler(true)
////        }
////        deleteAction.backgroundColor = .red
////
////        // Вторая кнопка с другим действием
////        let printAction = UIContextualAction(style: .normal, title: "Принт") { _, _, completionHandler in
////            print("Принт на строке \(indexPath.row)")
////            completionHandler(true)
////        }
////        printAction.backgroundColor = .blue
////
////        // Возвращаем обе кнопки
////        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, printAction])
////        configuration.performsFirstActionWithFullSwipe = false // Отключаем полный свайп
////        return configuration
////    }
////}
////
////
////
////
////
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
////
////
////// MARK: - UITableViewDataSource
////extension BagTableView: UITableViewDataSource {
////
////    enum BagSections {
////        case firstSection([PromotionModel])
////        case secondSection([TopPickModel])
////        case thirdSection([TopPickModel])
////    }
////
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//// //       return bagVCData.count
//// //       return 1
////
////        switch bagSections[section] {
////
////        case .firstSection:
////            return firstSectionData.count
////        case .secondSection:
////            return bagVCData.count
////        case .thirdSection:
////            return 1
////        }
////    }
////
//////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//////        let cell = tableView.dequeuCell(indexPath) as Orders
//////        let model = bagVCData[indexPath.item]
//////        cell.updateData([model])
////////        cell.update(model)
//////
//////
//////        return cell
//////    }
////
////    func numberOfSections(in tableView: UITableView) -> Int {
//////        return bagVCData.count
////        return bagSections.count
////    }
////
//////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//////        let sectionData = bagSections[indexPath.section]
//////        switch sectionData {
//////
//////        case .firstSection:
//////            return 200
//////        case .secondSection:
//////            return 200
//////        case .thirdSection:
//////            return 300
//////        }
//////    }
////
////        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////
////
//////            let cell = tableView.dequeuCell(indexPath) as Orders
//////            let model = bagVCData[indexPath.row]
//////            cell.configure(delegate: self, indexPath: indexPath, model: [model])
//////  //          cell.update(model)
//////            return cell
//////
////            let sectionData = bagSections[indexPath.section]
////            switch sectionData {
////
////
////            case .firstSection(let model):
////                let cell = tableView.dequeuCell(indexPath) as TemporaryPromotionCell
////                let model = model[indexPath.item]
////                cell.update(model)
////                return cell
////
////            case .secondSection(let model):
////                let cell = tableView.dequeuCell(indexPath) as OrdersCell
////                let model = model[indexPath.row]
////      //          cell.configure(delegate: self, indexPath: indexPath, model: [model])
////                cell.update(model)
////                return cell
////
////            case .thirdSection(let model):
////                let cell = tableView.dequeuCell(indexPath) as TVPlusCVCell
//////                let model = model[indexPath.item]
////                cell.updateData(model)
//////                cell.update(model)
////
////                return cell
////            }
////
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
////extension BagTableView: OrdersCellDelegate {
//////    func didRequestDeleteItem(at indexPath: IndexPath) {
//////        guard indexPath.row < bagVCData.count else { return }
//////        bagVCData.remove(at: indexPath.row)
//////        deleteRows(at: [indexPath], with: .automatic)
////////        reloadData()
//////
////////        let updatedData = self.orderService.delete(model)
////////        self.data = updatedData
//////    }
////
////    func didRequestDeleteItem(at indexPath: IndexPath) {
////        guard indexPath.row < bagVCData.count else { return }
////        bagVCData.remove(at: indexPath.row)
////        reloadData()
////    }
////}
//
////extension BagTableView: OrdersCellDelegate {
////    func didRequestDeleteItem(at indexPath: IndexPath) {
////        guard indexPath.row < bagVCData.count else { return }
////        bagVCData.remove(at: indexPath.row)
////        deleteRows(at: [indexPath], with: .automatic)
////    }
////}
//
////extension BagTableView: OrdersCellDelegate {
////    func didRequestDeleteItem(at indexPath: IndexPath, model: TopPickModel) {
////        let updatedData = OrdersService().delete(model) // Удаляем из хранилища
////        bagVCData = updatedData // Обновляем локальные данные
////        deleteRows(at: [indexPath], with: .automatic)
////    }
////}
//
//extension BagTableView: OrdersCellDelegate {
//    func didRequestDeleteItem(at indexPath: IndexPath, model: TopPickModel) {
//        // Удаление из хранилища
//        let updatedData = OrdersService().delete(model)
//        bagVCData = updatedData
//        
//        // Обновление таблицы
//        deleteRows(at: [indexPath], with: .automatic)
//    }
//}
//
//
//


// 3.

//import UIKit
//
////protocol OrdersCellDelegate: AnyObject {
////    func didRequestDeleteItem(at indexPath: IndexPath)
////}
//
//protocol OrdersCellDelegate: AnyObject {
//    func didRequestDeleteItem(at indexPath: IndexPath, model: TopPickModel)
//}
//
////class Orders: UITableViewCell {
////
////    weak var delegate: OrdersCellDelegate?
////    var indexPath: IndexPath?
////
////    private var data: [TopPickModel] = []
////    var orderService: OrdersServiceProtocol = OrdersService()
////
//////    private var collectionViewHeightConstraint: NSLayoutConstraint?
////
////    lazy var collectionView: UICollectionView = {
////        let layout = UICollectionViewFlowLayout()
////        layout.scrollDirection = .vertical
////
////        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
////        collectionView.translatesAutoresizingMaskIntoConstraints = false
////        collectionView.registerCell(FavoriteCollectionViewCell.self)
////        collectionView.delegate = self
////        collectionView.dataSource = self
////        collectionView.isScrollEnabled = false
//// //       collectionView.backgroundColor = .orange
////        return collectionView
////    }()
////
////    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
////        super.init(style: style, reuseIdentifier: reuseIdentifier)
////        setupViews()
////        setupConstraints()
////    }
////
////    required init?(coder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
////
////    func setupViews() {
////        contentView.addSubview(collectionView)
////    }
////
////    func setupConstraints() {
//////        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 0)
//////        collectionViewHeightConstraint?.isActive = true
////
////            NSLayoutConstraint.activate([
////                collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
////                collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
////                collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
////                collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16) // Динамическая высота
////            ])
////    }
////
////
////
////
////
////
////
////        func configure(delegate: OrdersCellDelegate, indexPath: IndexPath, model: [TopPickModel]) {
////            self.delegate = delegate
////            self.indexPath = indexPath
////            self.updateData(model)
////        }
////
////    func updateData(_ data: [TopPickModel]) {
////        self.data = []
////        self.data = data
////        collectionView.reloadData()
////        updateCollectionViewHeight()
////    }
////
//////    func updateData(_ data: [TopPickModel]) {
//////        print("Updating data for cell: \(data.count) items")
//////        self.data = data
//////        collectionView.reloadData()
//////        updateCollectionViewHeight()
//////    }
////
////
//////    private func updateCollectionViewHeight() {
//////        layoutIfNeeded() // Заставляем пересчитать размеры
////////        let contentHeight = collectionView.collectionViewLayout.collectionViewContentSize.height
////////        collectionViewHeightConstraint?.constant = contentHeight
//////        layoutIfNeeded()
//////    }
////
////    private func updateCollectionViewHeight() {
////        collectionView.layoutIfNeeded()
////        let contentHeight = collectionView.collectionViewLayout.collectionViewContentSize.height
////        if contentHeight > 0 {
////            collectionView.heightAnchor.constraint(equalToConstant: contentHeight).isActive = true
////        }
////    }
////
////
////}
////
//////MARK: - UICollectionViewDelegate, UICollectionViewDataSource
////extension Orders: UICollectionViewDelegate, UICollectionViewDataSource {
////
////    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return data.count
////    }
////
////    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        let cell = collectionView.dequeuCell(indexPath) as FavoriteCollectionViewCell
////
////        let model = data[indexPath.item]
////        cell.update(model, isEdining: true)
//////        cell.onDelete = {
//////            let updatedData = self.orderService.delete(model)
//////            self.data = updatedData
//////            self.collectionView.reloadData()
//////        }
////
//////        cell.onDelete = {
//////            guard let indexPath = self.indexPath else { return }
//////            self.delegate?.didRequestDeleteItem(at: indexPath, model: model)
//////        }
////        return cell
////    }
////
////
////
////
////}
////
////extension Orders: UICollectionViewDelegateFlowLayout {
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        return CGSize(width: collectionView.bounds.width, height: 100) // Например, 100 высота
////    }
////}
////
////extension Orders: UITableViewDelegate {
////    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
////        // Создаем действие "Удалить"
////        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] _, _, completionHandler in
////            guard let self = self else { return }
////
////            // Получаем модель, соответствующую ячейке
////            let model = self.data[indexPath.row]
////
////            // Удаляем элемент через service
////            self.data = self.orderService.delete(model)
////
////            // Обновляем таблицу
////            tableView.deleteRows(at: [indexPath], with: .automatic)
////
////            completionHandler(true) // Завершаем обработку действия
////        }
////
////        deleteAction.backgroundColor = .red // Устанавливаем цвет кнопки
////
////        // Возвращаем конфигурацию свайпа
////        return UISwipeActionsConfiguration(actions: [deleteAction])
////    }
////}
//
//
//
//
//
//
//class OrdersCell: UITableViewCell {
//    
//    var rowHeight: [CGFloat] = []
//    
//    private var heightConstraint: NSLayoutConstraint?
//    
//    let priceLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.numberOfLines = 0
//        return label
//    }()
//    
////    let priceLabel = Label(type: .price)
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupViews()
//        setupConstraints()
// //       self.backgroundColor = .red
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func update(_ model: TopPickModel) {
//        priceLabel.text = model.price
//    }
//}
//
////MARK: - Layout
//extension OrdersCell {
//   
//    func setupViews() {
//        contentView.addSubview(priceLabel)
//    }
//    
//    func setupConstraints() {
//        priceLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
////            priceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            
//            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
////            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
////            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
//            
//
//        ])
//        
//        let heightConstraint = contentView.heightAnchor.constraint(equalToConstant: 100)
//        heightConstraint.priority = .defaultHigh
//        heightConstraint.isActive = true
//    }
//}
//
//


// 6.

//class TVPlusCVCell: UITableViewCell {
//
//    private let containerView = UIView()
//        private var data: [TopPickModel] = []
//
//        lazy var collectionView: UICollectionView = {
//            let layout = UICollectionViewFlowLayout()
//            layout.scrollDirection = .vertical
//
//            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//            collectionView.translatesAutoresizingMaskIntoConstraints = false
//            collectionView.registerCell(FavoriteCollectionViewCell.self)
//            collectionView.delegate = self
//            collectionView.dataSource = self
//            collectionView.isScrollEnabled = false
//            collectionView.backgroundColor = .cyan
//            return collectionView
//        }()
//
//        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//            super.init(style: style, reuseIdentifier: reuseIdentifier)
//            setupViews()
//            setupConstraints()
//        }
//
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//
//        func setupViews() {
//            contentView.addSubview(containerView)
//            containerView.addSubview(collectionView)
//
//            containerView.backgroundColor = .lightGray
//            containerView.layer.cornerRadius = 8
//            containerView.layer.masksToBounds = true
//  //          contentView.addSubview(collectionView)
//        }
//
//        func setupConstraints() {
//
//            containerView.translatesAutoresizingMaskIntoConstraints = false
//
//                NSLayoutConstraint.activate([
//
//                    containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
//                    containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//                    containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//                    containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
//
//                    collectionView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
//                    collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
//                    collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -8),
//                    collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
// //                   collectionView.heightAnchor.constraint(equalToConstant: 300)
//                ])
//        }
//
//
//
//
//
//
////
////            func configure(delegate: OrdersCellDelegate, indexPath: IndexPath, model: [TopPickModel]) {
////                self.delegate = delegate
////                self.indexPath = indexPath
////                self.updateData(model)
////            }
//
//        func updateData(_ data: [TopPickModel]) {
// //           self.data = []
//            self.data = data
//            collectionView.reloadData()
//            updateCollectionViewHeight()
//        }
//
//
//        private func updateCollectionViewHeight() {
//            collectionView.layoutIfNeeded()
//            let contentHeight = collectionView.collectionViewLayout.collectionViewContentSize.height
//            if contentHeight > 0 {
//                collectionView.heightAnchor.constraint(equalToConstant: contentHeight).isActive = true
//            }
//        }
//
//
//    }
//
//    //MARK: - UICollectionViewDelegate, UICollectionViewDataSource
//    extension TVPlusCVCell: UICollectionViewDelegate, UICollectionViewDataSource {
//
//        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//  //          return 1
//            return data.count
//        }
//
//        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            let cell = collectionView.dequeuCell(indexPath) as FavoriteCollectionViewCell
//
//            let model = data[indexPath.item]
//            cell.update(model, isEdining: true)
//
//            return cell
//        }
//
//
//
//
//    }
  


// 7.


