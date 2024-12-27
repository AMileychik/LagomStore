//
//  Notes.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/14/24.
//

import Foundation

//1. ConvertToPageControlModels

////
////  DetailVC.swift
////  LagomStore
////
////  Created by Александр Милейчик on 10/28/24.
////
//
//import UIKit
//
//class DetailVC: UIViewController {
//    
//    private let topPicksLoader: ITopPicksLoader
//    var tableView = DetailTableView()
//    
//    init(productsLoader: ITopPicksLoader) {
//        self.topPicksLoader = productsLoader
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        self.topPicksLoader = TopPicksLoader()
//        super.init(coder: coder)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupViews()
//        setupConstraints()
//    }
//}
//
//// MARK: - Layout
//extension DetailVC {
//    
//    func setupViews() {
//        view.addSubview(tableView)
//    }
//    
//    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//}
//
//// MARK: - Data Conversion
//extension DetailVC {
//    
//    // Преобразует массив TopPickModel в массив PageControlModel
////    private func convertToPageControlModels(from topPicks: [TopPickModel]) -> [SubCategoryModel] {
////        return topPicks.map { topPick in
////            SubCategoryModel(
////                image3: topPick.image, currentSubCategory: "")
////        }
////    }
//}
//
//// MARK: - Business Logic
//extension DetailVC {
//    
////    func loadProducts() {
////        topPicksLoader.loadHomeVCData { [weak self] result in
////            guard let self = self else { return }
////            switch result {
////
////            case .success(let products):
////
////                tableView.dataModels =
////                [
////                    .detailButtons(products.detailButtons)
////
////                ]
////
////            case .failure(let error):
////                print(error)
////            }
////            tableView.reloadData()
////
////        }
////    }
//    
//    func updateWithCategory(_ topPicksModel: [TopPickModel],  category: String) {
//        
//        guard let subCategories = topPicksModel.first?.shoesCategory?.first?.subCategories else { return }
//        
//        let filteredCategories = topPicksModel.filter { $0.category == category }
//        guard let buttonsData = topPicksModel.first?.detailButtons else { return }
//        
//        
//        if !filteredCategories.isEmpty {
//            //                    let pageControlModels = convertToPageControlModels(from: filteredTopPicks)
//            tableView.dataModels = [
//                
//                .pageControl(subCategories),
//                .productOptions(filteredCategories),
//                .detailButtons(buttonsData)
//            ]
//            
//            tableView.reloadData()
//        } else {
//            print("No data found for category: \(category)")
//        }
//    }
//}
//


// 3. Example UICollectionViewCellWithInitSettings

//class ThisWeekTopStoriesCollectionViewCell: UICollectionViewCell {
//
//    private let photoImageView = ImageView(type: .favorite)
//    private let nameLabel = Label(type: .description)
//    private let descriptionLabel = Label(type: .description)
//
//    private let horizontalStackView = StackView(type: .productCell)
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//        setupConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
////MARK: - Public
//extension ThisWeekTopStoriesCollectionViewCell {
//
//    func updateThisWeekTopStories(_ model: TopPickModel) {
//        photoImageView.image = UIImage(named: model.image)
//        nameLabel.text = model.description
//        descriptionLabel.text = model.type
//    }
//}
//
////MARK: - Layout
//extension ThisWeekTopStoriesCollectionViewCell {
//
//    func setupViews() {
//        backgroundColor = .systemBackground
//        contentView.addSubview(photoImageView)
//        contentView.addSubview(horizontalStackView)
//        horizontalStackView.addArrangedSubview(nameLabel)
//        horizontalStackView.addArrangedSubview(descriptionLabel)
//    }
//
//    func setupConstraints() {
//        photoImageView.translatesAutoresizingMaskIntoConstraints = false
//        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//
//            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//
//            horizontalStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor),
//            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//        ])
//    }
//}
//
//
//


//4. OrthogonalContainerCell

//
//  MainTableViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 9/30/24.
//

//import UIKit
//
//protocol TopPicksCellDelegate: AnyObject {
//    func didSelectItem(with model: [TopPickModel], category: String)
//}
//
//enum CellDataType {
//    case topPicks
//    case categories
//    case thisWeekTopStories
//    case recentlyViewed
//    case newAndFeatured
//    case nearbyStore
//
//}
//
//class OrthogonalContainerCell: UITableViewCell {
//
//    weak var delegate: TopPicksCellDelegate?
//   
//    private var topPicksProducts: [TopPickModel] = []
//    private var categories: [Categories] = []
//    private var thisWeekTopStoriesData: [TopPickModel] = []
//    private var newAndFeaturedData: [TopPickModel] = []
//    private var recentlyViewedData: [TopPickModel] = []
//    private var nearbyStoreSectionData: [TopPickModel] = []
//    
//    private var dataType: CellDataType = .topPicks
//    
//    private var collectionViewHeightConstraint: NSLayoutConstraint!
//    
//    var removeSection: (() -> Void)?
//    
//    private lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private lazy var subtitleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private let labelStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.alignment = .leading
//        stackView.spacing = 4
//        return stackView
//    }()
//    
//    private lazy var actionButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitleColor(.systemBlue, for: .normal)
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        return button
//    }()
//    
//    private lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
////        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        layout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.registerCell(TopPicksCollectionViewCell.self)
//        collectionView.registerCell(CategoriesCollectionViewCell.self)
//        collectionView.registerCell(UniversalCollectionViewCell.self)
//        collectionView.registerCell(NearbyStoresCollectionViewCell.self)
//        
//        return collectionView
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupViews()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupViews() {
//        contentView.addSubview(labelStackView)
//        contentView.addSubview(actionButton)
//        contentView.addSubview(collectionView)
//        
//        labelStackView.addArrangedSubview(titleLabel)
//        labelStackView.addArrangedSubview(subtitleLabel)
//                
//        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 0)
//        
//        NSLayoutConstraint.activate([
//            labelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            labelStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
//            
//            collectionView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 0),
//            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            
//            collectionView.heightAnchor.constraint(equalToConstant: 300),
//        
//            
//            collectionViewHeightConstraint,
//            
//            actionButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
//            actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
//            
//            actionButton.widthAnchor.constraint(equalToConstant: 75),
//            actionButton.heightAnchor.constraint(equalToConstant: 35)
//        ])
//    }
//    
//    func updateHeader(_ model: UniversalHeaderModel) {
//        titleLabel.text = model.firstLabelText
//        subtitleLabel.text = model.subtitleLabel
//        actionButton.setTitle(model.buttonTitle, for: .normal)
//    }
//    
//    func update(_ model: [TopPickModel]) {
//        self.topPicksProducts = model
//        self.dataType = .topPicks
//        collectionView.reloadData()
//    }
//    
//    func updateThisWeekTopStories(_ model: [TopPickModel]) {
//        self.thisWeekTopStoriesData = model
//        self.dataType = .thisWeekTopStories
//        collectionView.reloadData()
//    }
//    
//    func updatenewAndFeaturedTopStories(_ model: [TopPickModel]) {
//        self.newAndFeaturedData = model
//        self.dataType = .newAndFeatured
//        collectionView.reloadData()
//    }
//    
//    func updateNearbyStoreSection(_ model: [TopPickModel]) {
//        self.nearbyStoreSectionData = model
//        self.dataType = .nearbyStore
//        collectionView.reloadData()
//    }
//
////    func updateCollectionViewHeight(_ height: CGFloat) {
////        // Обновляем высоту констрейнта
////        collectionViewHeightConstraint.constant = height
////  //      layoutIfNeeded()  // Обновляем layout сразу
////    }
//    
//    func update2(_ model: [TopPickModel]) {
//        self.topPicksProducts = model
//        self.dataType = .topPicks
//        collectionView.reloadData()
//    }
//
//    
//    func updateS(_ model: [Categories]) {
//        self.categories = model
//        self.dataType = .categories
//        collectionView.reloadData()
//    }
//
//    @objc private func buttonTapped() {
//        removeSection?()
//    }
//}
//
//extension OrthogonalContainerCell: UICollectionViewDelegate {
//   
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        switch dataType {
//        case .topPicks:
//            let selectedModel = topPicksProducts[indexPath.item]
//            let categoryName = selectedModel.categoryName ?? ""
//            delegate?.didSelectItem(with: [selectedModel], category: categoryName)
//        case .categories:
//            _ = categories[indexPath.item]
////            let categoryName = selectedCategory.image2 ?? ""
////            delegate?.didSelectItem(with: [selectedCategory], category: categoryName)
//        case .thisWeekTopStories:
//            _ = categories[indexPath.item]
//
//        case .recentlyViewed:
//            _ = categories[indexPath.item]
//
//        case .newAndFeatured:
//            _ = categories[indexPath.item]
//
//        case .nearbyStore:
//            _ = categories[indexPath.item]
//        }
//    }
//}
//
//extension OrthogonalContainerCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        switch dataType {
//        case .topPicks:
//            return topPicksProducts.count
//        case .categories:
//            return categories.count
//        case .thisWeekTopStories:
//            return thisWeekTopStoriesData.count
//        case .recentlyViewed:
//            return recentlyViewedData.count
//        case .newAndFeatured:
//            return newAndFeaturedData.count
//        case .nearbyStore:
//            return nearbyStoreSectionData.count
//        }
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//  
//        switch dataType {
//        case .topPicks:
//            
//            let cell = collectionView.dequeuCell(indexPath) as TopPicksCollectionViewCell
//            let data = topPicksProducts[indexPath.item]
//            cell.updateTopPicks(data)
//            
//            return cell
//            
//        case .categories:
//            
//            let cell = collectionView.dequeuCell(indexPath) as CategoriesCollectionViewCell
//            let data = categories[indexPath.item]
//            cell.updateCategories(data)
//            
//            return cell
//
//        case .thisWeekTopStories:
//          
//            let cell = collectionView.dequeuCell(indexPath) as TopPicksCollectionViewCell
//            let data = thisWeekTopStoriesData[indexPath.item]
//            
//            cell.updateTopPicks(data)
//            
//            return cell
//            
//        case .recentlyViewed:
//            let cell = collectionView.dequeuCell(indexPath) as TopPicksCollectionViewCell
//            let data = thisWeekTopStoriesData[indexPath.item]
//            
//            cell.updateTopPicks(data)
//
//            
//            return cell
//            
//        case .newAndFeatured:
//           
//            let cell = collectionView.dequeuCell(indexPath) as TopPicksCollectionViewCell
//            let data = newAndFeaturedData[indexPath.item]
//            cell.updateTopPicks(data)
//
//            return cell
//       
//        case .nearbyStore:
//            
//            let cell = collectionView.dequeuCell(indexPath) as NearbyStoresCollectionViewCell
//            let data = nearbyStoreSectionData[indexPath.item]
//            cell.updateNearbyStoreSection(data)
//
//            return cell
//        }
//    }
//    
////    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////
////        switch dataType {
////        case .topPicks:
////
////            let cell = collectionView.dequeuCell(indexPath) as TopPicksCollectionViewCell
////            let data = topPicksProducts[indexPath.item]
////            cell.updateTopPicks(data)
////
////            return cell
////
////        case .categories:
////
////            let cell = collectionView.dequeuCell(indexPath) as CategoriesCollectionViewCell
////            let data = categories[indexPath.item]
////            cell.updateCategories(data)
////
////            return cell
////
////        case .thisWeekTopStories:
////
////            let cell = collectionView.dequeuCell(indexPath) as UniversalCollectionViewCell
////            let data = thisWeekTopStoriesData[indexPath.item]
//////            cell.updateThisWeekTopStories(data)
////
//////            cell.updateTopPicks(data)
////            cell.configure(section: .thisWeekTopStories, model: data)
////
////            return cell
////
////        case .recentlyViewed:
////            let cell = collectionView.dequeuCell(indexPath) as UniversalCollectionViewCell
////            let data = thisWeekTopStoriesData[indexPath.item]
//////            cell.updateThisWeekTopStories(data)
////
//// //           cell.updateTopPicks(data)
////
////            cell.configure(section: .topPick, model: data)
////
////            return cell
////
////        case .newAndFeatured:
////
////            let cell = collectionView.dequeuCell(indexPath) as UniversalCollectionViewCell
////            let data = newAndFeaturedData[indexPath.item]
////            cell.configure(section: .newAndFeatured, model: data)
//////            cell.updateTopPicks(data)
////
////            return cell
////        }
////    }
//    
//    
//}
//
//extension OrthogonalContainerCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        switch dataType {
//            
//        case .topPicks:
//            return CGSize(width: 150, height: 265)
//        case .categories:
//            return CGSize(width: 100, height: 100)
//        case .thisWeekTopStories:
//            return CGSize(width: 225, height: 225)
//        case .recentlyViewed:
//            return CGSize(width: 150, height: 265)
//        case .newAndFeatured:
//            return CGSize(width: 150, height: 265)
//        case .nearbyStore:
//            return CGSize(width: 275, height: 325)
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 16
//    }
//}

// 5. TitleLabel, labelStackView

//private lazy var titleLabel: UILabel = {
//    let label = UILabel()
//    label.translatesAutoresizingMaskIntoConstraints = false
//    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//    label.numberOfLines = 0
//    return label
//}()

//private let labelStackView: UIStackView = {
//    let stackView = UIStackView()
//    stackView.translatesAutoresizingMaskIntoConstraints = false
//    stackView.axis = .vertical
//    stackView.alignment = .leading
//    stackView.spacing = 4
//    return stackView
//}()


// 7. ShopTableView

//class ShopTableView: UITableView {
//
//    private let loader: ILoader
//    var shopDataModel: [ShopVCSections] = []
//
//    private var topPicksProducts: [TopPickModel] = []
//
//    private var selectedControllerIndex: Int = 0
//
//    init(loader: ILoader) {
//        self.loader = loader
//        super.init(frame: .zero, style: .plain)
//        commonInit()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func commonInit() {
//        translatesAutoresizingMaskIntoConstraints = false
//        delegate = self
//        dataSource = self
//        separatorStyle = .none
//        allowsSelection = false
//
//        registerCell(ButtonsTableViewCell.self)
//        registerCell(UniversalOrthogonalCell.self)
//        registerCell(ListCell.self)
//    }
//}
//
//// MARK: - Business Logic
//extension ShopTableView {
//
//    private func updateDataModels(with products: RootModel, for buttonIndex: Int) {
//        switch buttonIndex {
//        case 0:
//            shopDataModel = [
//                .buttons,
//                .thisWeekTopStories(model: products.topPicks, header: products.topPickHeader),
//                .list(products.listModel),
//                .newAndFeatured(model: products.topPicks, header: products.topPickHeader),
//            ]
//        case 1:
//            shopDataModel = [
//                .buttons,
//                .thisWeekTopStories(model: products.topPicks, header: products.topPickHeader),
//                .list(products.listModel),
//                .newAndFeatured(model: products.topPicks, header: products.topPickHeader),
//            ]
//        default:
//            break
//        }
//        DispatchQueue.main.async {
//            self.reloadData()
//        }
//    }
//
//    func loadProducts(for buttonIndex: Int) {
//        loader.loadData { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success(let products):
//                self.updateDataModels(with: products, for: buttonIndex)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//}
//
//// MARK: - UITableViewDelegate
//extension ShopTableView: UITableViewDelegate {}
//
//// MARK: - UITableViewDataSource
//extension ShopTableView: UITableViewDataSource {
//
//    enum ShopVCSections {
//        case buttons
//        case thisWeekTopStories(model: [TopPickModel], header: UniversalHeaderModel)
//        case list([ListModel])
//        case recentlyViewed(model: [TopPickModel], header: UniversalHeaderModel)
//        case newAndFeatured(model: [TopPickModel], header: UniversalHeaderModel)
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return shopDataModel.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let sections = shopDataModel[indexPath.section]
//
//        switch sections {
//
//        case .buttons:
//
//            let cell = tableView.dequeuCell(indexPath) as ButtonsTableViewCell
//
//            cell.buttonTapAction1 = { [weak self] index in
//                self?.loadProducts(for: index)
//                self?.selectedControllerIndex = index
//                tableView.reloadSections(IndexSet(integer: 1), with: .none)
//            }
//
//            cell.buttonTapAction2 = { [weak self] index in
//                self?.loadProducts(for: index)
//                self?.selectedControllerIndex = index
//                tableView.reloadSections(IndexSet(integer: 1), with: .none)
//            }
//
//            cell.buttonTapAction3 = { [weak self] index in
//                self?.selectedControllerIndex = index
//                tableView.reloadSections(IndexSet(integer: 1), with: .none)
//            }
//
//            cell.configureHeight(50)
//            return cell
//
//        case .thisWeekTopStories(model: let model, header: let header):
//
//            let cell = tableView.dequeuCell(indexPath) as UniversalOrthogonalCell
//            cell.updateThisWeekTopStories(model)
//            cell.updateHeader(header)
//            let collectionViewHeight: CGFloat = 250
//            cell.updateCollectionViewHeight(collectionViewHeight)
//
//            return cell
//
//        case .list(let model):
//
//            let cell = tableView.dequeuCell(indexPath) as ListCell
//            cell.configure(model, heights: [110, 110, 110, 110], gradientIndexes: [])
//
//            let tableViewHeight: CGFloat = 450
//            cell.updateTableViewHeight(tableViewHeight)
//
//            return cell
//
//        case .recentlyViewed(model: let model, header: let header):
//
//            let cell = tableView.dequeuCell(indexPath) as UniversalOrthogonalCell
//            cell.update(model)
//            let collectionViewHeight: CGFloat = 400
//            cell.updateCollectionViewHeight(collectionViewHeight)
//            cell.updateHeader(header)
//
//            cell.removeSection = { [weak self] in
//                guard let self = self else { return }
//                self.removeSection(at: indexPath.section)
//            }
//            return cell
//
//        case .newAndFeatured(model: let model, header: let header):
//
//            let cell = tableView.dequeuCell(indexPath) as UniversalOrthogonalCell
//            cell.updatenewAndFeaturedTopStories(model)
//            cell.updateHeader(header)
//            let collectionViewHeight: CGFloat = 275
//            cell.updateCollectionViewHeight(collectionViewHeight)
//
//            return cell
//        }
//    }
//
//    // MARK: - Delete section
//    func removeSection(at index: Int) {
//        shopDataModel.remove(at: index)
//        beginUpdates()
//        deleteSections(IndexSet(integer: index), with: .bottom)
//        endUpdates()
//    }
//}



//!!!

// ShopTableView tests

//class ShopTableView: UITableView {
//
//    private let loader: ILoader
//    private var selectedControllerIndex: Int = 0
//    var shopDataModel: [ShopVCSections] = []
//
//    init(loader: ILoader) {
//        self.loader = loader
//        super.init(frame: .zero, style: .plain)
//        commonInit()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func commonInit() {
//        translatesAutoresizingMaskIntoConstraints = false
//        delegate = self
//        dataSource = self
//        separatorStyle = .none
//        allowsSelection = false
//
//        registerCell(ButtonsTableViewCell.self)
//        registerCell(OrthogonalContainerCell.self)
//        registerCell(ListCell.self)
//        registerCell(NearbyStoresCell.self)
//        registerCell(RecentlyViewedCell.self)
//        registerCell(ShopListCell.self)
//        registerCell(NewAndFeaturedCell.self)
//    }
//}
//
//// MARK: - Business Logic
//extension ShopTableView {
//
//    private func updateDataModels(with products: RootModel, for buttonIndex: Int) {
//        switch buttonIndex {
//        case 0:
//            shopDataModel = [
//                .buttons,
//                .thisWeekTopStories(model: products.topPicks, header: products.thisWeekHeader),
//                .list(products.thankYou),
//                .newAndFeatured(model: products.topPicks, header: products.thisWeekHeader),
//                .recentlyViewed(model: products.topPicks, header: products.thisWeekHeader),
//                .claccicsSpotlight(model: products.topPicks, header: products.thisWeekHeader),
//                .recommendedForYou(model: products.topPicks, header: products.thisWeekHeader),
//                .nearbyStore(model: products.thankYou, header: products.thisWeekHeader)
//            ]
//        case 1:
//            shopDataModel = [
//                .buttons,
//                .thisWeekTopStories(model: products.topPicks, header: products.thisWeekHeader),
//                .list(products.thankYou),
//                .newAndFeatured(model: products.topPicks, header: products.thisWeekHeader),
//                .recentlyViewed(model: products.topPicks, header: products.thisWeekHeader),
//                .claccicsSpotlight(model: products.topPicks, header: products.thisWeekHeader),
//                .recommendedForYou(model: products.topPicks, header: products.thisWeekHeader),
//                .nearbyStore(model: products.thankYou, header: products.thisWeekHeader)
//            ]
//        default:
//            break
//        }
//        DispatchQueue.main.async {
//            self.reloadData()
//        }
//    }
//
//    func loadProducts(for buttonIndex: Int) {
//        loader.loadData { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success(let products):
//                self.updateDataModels(with: products, for: buttonIndex)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//}
//
//
//// MARK: - UITableViewDelegate
//extension ShopTableView: UITableViewDelegate {}
//
//// MARK: - UITableViewDataSource
//extension ShopTableView: UITableViewDataSource {
//
//    enum ShopVCSections {
//        case buttons
//        case thisWeekTopStories(model: [TopPickModel], header: ThisWeekHeader)
//        case list([ThankYouModel])
//        case newAndFeatured(model: [TopPickModel], header: ThisWeekHeader)
//        case recentlyViewed(model: [TopPickModel], header: ThisWeekHeader)
//        case claccicsSpotlight(model: [TopPickModel], header: ThisWeekHeader)
//        case recommendedForYou(model: [TopPickModel], header: ThisWeekHeader)
//        case nearbyStore(model: [ThankYouModel], header: ThisWeekHeader)
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return shopDataModel.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let sections = shopDataModel[indexPath.section]
//
//        switch sections {
//
//        case .buttons:
//
//            let cell = tableView.dequeuCell(indexPath) as ButtonsTableViewCell
//
//            cell.buttonTapAction1 = { [weak self] index in
//                self?.loadProducts(for: index)
//                self?.selectedControllerIndex = index
//                tableView.reloadSections(IndexSet(integer: 1), with: .none)
//
//            }
//
//            cell.buttonTapAction2 = { [weak self] index in
//                self?.loadProducts(for: index)
//                self?.selectedControllerIndex = index
//                tableView.reloadSections(IndexSet(integer: 1), with: .none)
//            }
//
//            cell.buttonTapAction3 = { [weak self] index in
//                self?.selectedControllerIndex = index
//                tableView.reloadSections(IndexSet(integer: 1), with: .none)
//            }
//
//            cell.configureHeight(50)
//            return cell
//
//        case .thisWeekTopStories(model: let model, header: let header):
//
//            let cell = tableView.dequeuCell(indexPath) as OrthogonalContainerCell
//            cell.update(with: .thisWeekTopStories(models: model), collectionViewHeight: 265)
//            cell.configureThisWeekHeader(with: header)
//
//            return cell
//
//        case .list(let model):
//
//            let cell = tableView.dequeuCell(indexPath) as ShopListCell
//            cell.configure(model, heights: [110, 110, 110, 110])
//
//            let tableViewHeight: CGFloat = 450
//            cell.updateTableViewHeight(tableViewHeight)
//
//            return cell
//
//        case .newAndFeatured(model: let model, header: let header):
//
//            let cell = tableView.dequeuCell(indexPath) as NewAndFeaturedCell
//
//            cell.updateNewAndFeaturedSection(model)
//            cell.configureThisWeekHeader(with: (header))
//            let collectionViewHeight: CGFloat = 275
//            cell.updateCollectionViewHeight(collectionViewHeight)
//
//            return cell
//
//        case .recentlyViewed(model: let model, header: let header):
//
//            let cell = tableView.dequeuCell(indexPath) as RecentlyViewedCell
//            cell.updateRecentlyViewed(model)
//            cell.configureThisWeekHeader(with: header)
//            let collectionViewHeight: CGFloat = 250
//            cell.updateCollectionViewHeight(collectionViewHeight)
//
//            cell.onRemoveSection = { [weak self] in
//                guard let self = self else { return }
//                self.removeSection(at: indexPath.section)
//            }
//            return cell
//
//        case .claccicsSpotlight(model: let model, header: let header):
//
//            let cell = tableView.dequeuCell(indexPath) as NewAndFeaturedCell
//
//            cell.updateNewAndFeaturedSection(model)
//            cell.configureThisWeekHeader(with: header)
//            let collectionViewHeight: CGFloat = 275
//            cell.updateCollectionViewHeight(collectionViewHeight)
//
//            return cell
//
//        case .recommendedForYou(model: let model, header: let header):
//
//            let cell = tableView.dequeuCell(indexPath) as RecentlyViewedCell
//            cell.updateRecentlyViewed(model)
//            cell.configureThisWeekHeader(with: header)
//            let collectionViewHeight: CGFloat = 250
//            cell.updateCollectionViewHeight(collectionViewHeight)
//
//            return cell
//
//        case .nearbyStore(model: let model, header: let header):
//
//            let cell = tableView.dequeuCell(indexPath) as NearbyStoresCell
//            cell.updateSection(.nearbyStoreSectionData(models: model))
//            cell.configureThisWeekHeader(with: header)
//            let collectionViewHeight: CGFloat = 250
//            cell.updateCollectionViewHeight(collectionViewHeight)
//
//            return cell
//        }
//    }
//
//    // MARK: - Delete section
//    func removeSection(at index: Int) {
//        shopDataModel.remove(at: index)
//        beginUpdates()
//        deleteSections(IndexSet(integer: index), with: .bottom)
//        endUpdates()
//    }
//}


// !!! ShopVC tests

//class ShopVC: UIViewController {
//
//    private let loader: ILoader
//    private let tableView: ShopTableView
//
//    init(loader: ILoader) {
//        self.loader = loader
//        self.tableView = ShopTableView(loader: loader)
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
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
////MARK: - Business Logic
//extension ShopVC {
//
//    private func updateDataModels(with products: RootModel) {
//        tableView.shopDataModel =
//            [
//                .buttons,
//                .thisWeekTopStories(model: products.topPicks, header: products.thisWeekHeader),
//                .list(products.thankYou),
//                .newAndFeatured(model: products.topPicks, header: products.thisWeekHeader),
//                .recentlyViewed(model: products.topPicks, header: products.thisWeekHeader),
//                .claccicsSpotlight(model: products.topPicks, header: products.thisWeekHeader),
//                .recommendedForYou(model: products.topPicks, header: products.thisWeekHeader),
//                .nearbyStore(model: products.thankYou, header: products.thisWeekHeader)
//            ]
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
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
//extension ShopVC {
//
//    func setupView() {
//        view.addSubview(tableView)
//    }
//
//    func setupConstraints() {
//
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//}

// 10
//class NewAndFeaturedCell: UITableViewCell {
//
//    private var updateNewAndFeaturedData: [TopPickModel] = []
//    private let descriptionLabel = Label(type: .description)
//
//    private var collectionViewHeightConstraint: NSLayoutConstraint!
//
//    private lazy var titleLabel = Label(type: .name)
//
//    private let labelStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.alignment = .leading
//        stackView.spacing = 4
//        return stackView
//    }()
//
//    private lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
////        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        layout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.registerCell(TopPicksCollectionViewCell.self)
//        collectionView.registerCell(CategoriesCollectionViewCell.self)
//        collectionView.registerCell(UniversalCollectionViewCell.self)
//        collectionView.registerCell(NearbyStoresCollectionViewCell.self)
//        collectionView.registerCell(NewAndFeaturedCellCollectionViewCell.self)
//
//        return collectionView
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupViews()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupViews() {
//        contentView.addSubview(labelStackView)
//        contentView.addSubview(collectionView)
//
//        labelStackView.addArrangedSubview(titleLabel)
//
//        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 0)
//
//        NSLayoutConstraint.activate([
//            labelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            labelStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
//
//            collectionView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 0),
//            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//
//            collectionViewHeightConstraint
//        ])
//    }
//
//    func configureHeader(with header: TitleHeaderModel?) {
//        titleLabel.text = header?.title
////        subtitleLabel.text = header?.subtitleLabel
////        actionButton.setTitle(header?.buttonTitle, for: .normal)
////        headerStackView.isHidden = header == nil
//    }
//
//    func configureThisWeekHeader(with header: ThisWeekHeader?) {
//        titleLabel.text = header?.firstLabelText
//    }
//
//    func updateNewAndFeaturedSection(_ model: [TopPickModel]) {
//        self.updateNewAndFeaturedData = model
//        collectionView.reloadData()
//    }
//
//    func updateCollectionViewHeight(_ height: CGFloat) {
//        collectionViewHeightConstraint.constant = height
//    }
//}
//
//extension NewAndFeaturedCell: UICollectionViewDelegate {}
//
//extension NewAndFeaturedCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return updateNewAndFeaturedData.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//            let cell = collectionView.dequeuCell(indexPath) as NewAndFeaturedCellCollectionViewCell
//            let data = updateNewAndFeaturedData[indexPath.item]
//            cell.updateNewAndFeaturedSection(data)
//
//            return cell
//        }
//    }
//
//
//extension NewAndFeaturedCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//            return CGSize(width: 150, height: 225)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 16
//    }
//}


// Example isSecondCollectionVisible
//class HomeTableView: UITableView {
//    
//    var dataModels: [MainSection] = []
//    private var isSecondCollectionVisible = true
//    weak var viewcontroller: UIViewController?
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
//    func commonInit() {
//        translatesAutoresizingMaskIntoConstraints = false
//        
//        delegate = self
//        dataSource = self
//        
//        separatorStyle = .none
//        allowsSelection = false
//        
//        registerCell(WelcomeCell.self)
//        registerCell(OrthogonalContainerCell.self)
//        registerCell(ThankYouCell.self)
//        registerCell(PageControlCell.self)
//        registerCell(VideoCell.self)
//        registerCell(ListCell.self)
//        registerCell(AlwaysPopularCell.self)
//        registerCell(RecentlyViewedCell.self)
//        registerCell(NearbyStoresCell.self)
//    }
//}
//
//extension HomeTableView: UITableViewDelegate {
//    
//    // Когда ячейка появляется на экране
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if let videoCell = cell as? VideoCell {
//            videoCell.playVideo()
//        }
//    }
//    
//    // Когда ячейка исчезает с экрана
//    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if let videoCell = cell as? VideoCell {
//            videoCell.pauseVideo()
//        }
//    }
//}
//
//extension HomeTableView: UITableViewDataSource {
//    enum MainSection {
//        case welcome(String)
//        case topPicks([TopPickModel], header: UniversalHeaderModel)
//        case pageControl([PageControlModel])
//        case list([ListModel], header: ListHeaderModel)
//        case productCategory1([ThankYouModel], header: UniversalHeaderModel)
//        case alwaysPopular([AlwaysPopularModel])
//        case productCategory2([TopPickModel], header: UniversalHeaderModel)
//        case thankYou([ThankYouModel])
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return dataModels.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let sectionData = dataModels[indexPath.section]
//        switch sectionData {
//            
//        case .welcome(let text):
//            let cell = tableView.dequeuCell(indexPath) as WelcomeCell
//            cell.update(text)
//            return cell
//            
//        case .topPicks(let model, let header):
//            let cell = tableView.dequeuCell(indexPath) as OrthogonalContainerCell
//            let sectionHeight: CGFloat = 285
//            cell.updateSection(dataType: .topPicks(model), height: sectionHeight)
//            cell.updateHeader(header)
//            cell.delegate = self
//            return cell
//            
//        case .pageControl(let model):
//            let cell = tableView.dequeuCell(indexPath) as PageControlCell
//            cell.update(model)
//            return cell
//            
//        case .list(let model, let header):
//            let cell = tableView.dequeuCell(indexPath) as ListCell
//            cell.update(header)
//            cell.configure(model, heights: [400, 400, 400, 200], gradientIndexes: [3])
//            let tableViewHeight: CGFloat = 1450
//            cell.updateTableViewHeight(tableViewHeight)
//            return cell
//            
//        case .productCategory1(let model, let header):
//            let cell = tableView.dequeuCell(indexPath) as NearbyStoresCell
//            cell.updateSection(.nearbyStoreSectionData(models: model))
// //           cell.updateHeader(header)
//            let sectionHeight: CGFloat = 350
//            cell.updateCollectionViewHeight(sectionHeight)
//            return cell
//            
//        case .alwaysPopular(let model):
//            let cell = tableView.dequeuCell(indexPath) as AlwaysPopularCell
//            let model = model[indexPath.item]
//            cell.update(model)
//            return cell
//            
//        case .productCategory2(let model, let header):
//            let cell = tableView.dequeuCell(indexPath) as NearbyStoresCell
////            cell.updateSection(.nearbyStoreSectionData(models: model))
////            cell.updateHeader(header)
//            let sectionHeight: CGFloat = 350
//            cell.updateCollectionViewHeight(sectionHeight)
//            return cell
//            
//        case .thankYou(let model):
//            let cell = tableView.dequeuCell(indexPath) as ThankYouCell
//            let model = model[indexPath.item]
//            cell.update(model)
////            cell.configureHeight(200)
//            return cell
//        }
//    }
//}
//
//extension HomeTableView: TopPicksCellDelegate {
//    
//    func didSelectItem(with model: [TopPickModel], category: String) {
//        let detailVC = di.screenFactory.makeDetailScreen()
//        detailVC.updateWithCategory(model, category: category)
//       
//        viewcontroller?.navigationController?.pushViewController(detailVC, animated: true)
//  //      print("\(category)")
//    }
//    
//    func didSelectItem2(with model: [ThankYouModel]) {
//        let detailVC = di.screenFactory.makeDetailScreen()
//        detailVC.updateWithCategory2(model)
//       
//        viewcontroller?.navigationController?.pushViewController(detailVC, animated: true)
//    }
//}


// MARK: - headerStackView.isHidden
// //    func configureHeader(with header: TitleHeaderModel?) {
//        titleLabel.text = header?.firstLabelText
//        subtitleLabel.text = header?.subtitleLabel
//        actionButton.setTitle(header?.buttonTitle, for: .normal)
//        headerStackView.isHidden = header == nil
//    }


// MARK: - Конфигурация для ячейки
//enum Sections {
//    case topPick
//    case thisWeekTopStories
//}
//
//// Конфигурация для ячейки
//struct CollectionViewCellConfig {
//    let imageType: ImageViewType2
//    let image: String
//    let nameText: String
//    let descriptionText: String
////    let stackViewType: StackViewType
//}
//
//
//class UniversalCollectionViewCell: UICollectionViewCell {
//    private let nameLabel = UILabel()
//    private let descriptionLabel = UILabel()
//    private let photoImageView = ImageView2()
//    private let horizontalStackView = UIStackView()
//
//
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//        setupConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        nameLabel.text = nil
//        descriptionLabel.text = nil
//        photoImageView.image = nil
//    }
//
//    func configure(section: Sections, model: Any) {
//        switch section {
//        case .topPick, .thisWeekTopStories:
//            guard let model = model as? TopPickModel else { return }
//            update(with: configureForModel(model, section: section))
//        }
//    }
//
//    private func update(with config: CollectionViewCellConfig) {
//        photoImageView.configure(type: config.imageType)
//        if let image = UIImage(named: config.image) {
//            photoImageView.image = image
//        }
//        nameLabel.text = config.nameText
//        descriptionLabel.text = config.descriptionText
//    }
//
//    private func setupViews() {
//        backgroundColor = .systemBackground
//        horizontalStackView.axis = .vertical
//        horizontalStackView.spacing = 8
//
//        contentView.addSubview(photoImageView)
//        contentView.addSubview(horizontalStackView)
//
//        horizontalStackView.addArrangedSubview(nameLabel)
//        horizontalStackView.addArrangedSubview(descriptionLabel)
//    }
//
//    private func setupConstraints() {
//        photoImageView.translatesAutoresizingMaskIntoConstraints = false
//        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//
//            horizontalStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 8),
//            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            horizontalStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
//        ])
//    }
//
//    private func configureForModel(_ model: TopPickModel, section: Sections) -> CollectionViewCellConfig {
//        switch section {
//        case .topPick:
//            return CollectionViewCellConfig(
//                imageType: .banner,
//                image: model.image,
//                nameText: model.type,
//                descriptionText: model.description
//            )
//        case .thisWeekTopStories:
//            return CollectionViewCellConfig(
//                imageType: .banner,
//                image: model.image,
//                nameText: model.type,
//                descriptionText: model.description
//            )
//        }
//    }
//}
//
//
//
// MARK: - VideoCell
//class VideoCell: UITableViewCell {
//
//    private var player: AVPlayer?
//    private var playerLayer: AVPlayerLayer?
//    private var gradientView: GradientView?
//    private var playerItem: AVPlayerItem?
//
//    // Инициализация и установка видео
//    func update(_ url: URL, addGradient: Bool) {
//        // Если плеера нет, создаем его
//        if player == nil {
//            playerItem = AVPlayerItem(url: url)
//            player = AVPlayer(playerItem: playerItem)
//            playerLayer = AVPlayerLayer(player: player)
//            guard let playerLayer = playerLayer else { return }
//
//            // Устанавливаем слой плеера во view ячейки
//            playerLayer.frame = contentView.bounds
//            playerLayer.videoGravity = .resizeAspectFill
//            contentView.layer.addSublayer(playerLayer)
//
//            // Добавляем наблюдателя за статусом
//            playerItem?.addObserver(self, forKeyPath: "status", options: [.new, .initial], context: nil)
//        }
//
//        // Добавляем градиент, если нужно
//        if addGradient, gradientView == nil {
//            let gradient = GradientView()
//            gradient.translatesAutoresizingMaskIntoConstraints = false
//            contentView.addSubview(gradient)
//
//            NSLayoutConstraint.activate([
//                gradient.topAnchor.constraint(equalTo: contentView.topAnchor),
//                gradient.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//                gradient.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//                gradient.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
//            ])
//
//            self.gradientView = gradient
//        }
//    }
//
//    // Управление проигрыванием видео
//    func playVideo() {
//        player?.play()
//    }
//
//    func pauseVideo() {
//        player?.pause()
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//
//        // Останавливаем плеер и очищаем ресурсы
//        player?.pause()
//        playerLayer?.removeFromSuperlayer()
//        player = nil
//        playerLayer = nil
//
//        // Убираем градиент
//        gradientView?.removeFromSuperview()
//        gradientView = nil
//
//        // Убираем наблюдателя за статусом
//        playerItem?.removeObserver(self, forKeyPath: "status")
//    }
//
//    // Метод для обработки изменения статуса
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "status", let playerItem = object as? AVPlayerItem {
//            if playerItem.status == .readyToPlay {
//                // Обновление UI после готовности видео
//                DispatchQueue.main.async {
//                    self.playVideo()
//                }
//                //               print("Видео готово для воспроизведения.")
//            } else if playerItem.status == .failed {
//                print("Ошибка загрузки видео.")
//            }
//        }
//    }
//
//    deinit {
//        // Убираем наблюдателя при деинициализации
//        playerItem?.removeObserver(self, forKeyPath: "status")
//    }
//}

// MARK: - CreateStackView

//private func createStackView(with views: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, alignment: UIStackView.Alignment = .fill, layoutMargins: UIEdgeInsets = .zero, isMarginsRelative: Bool = false) -> UIStackView {
//    let stackView = UIStackView(arrangedSubviews: views)
//    stackView.translatesAutoresizingMaskIntoConstraints = false
//    stackView.axis = axis
//    stackView.spacing = spacing
//    stackView.alignment = alignment
//    stackView.isLayoutMarginsRelativeArrangement = isMarginsRelative
//    if isMarginsRelative {
//        stackView.layoutMargins = layoutMargins
//    }
//    return stackView
//}
//
//private lazy var labelsStackView: UIStackView = createStackView(
//    with: [pageControlTitleLabel, pageControlDescriptionLabel],
//    axis: .vertical,
//    spacing: 4,
//    alignment: .leading,
//    layoutMargins: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 32),
//    isMarginsRelative: true
//)

//M MARK: - DependencyContainer

//Dependency Injection Container -> контейнер внедрения зависимостей -> контейнер всех сервисов

//Корневой объект
//DI, Di, DependencyContainer
//LoB - Locality of Behavior (Обособление по поведению)

//final class DependencyContainer {
//    
//    let session: URLSession
//    let decoder: JSONDecoder
//    let loader: Loader
//    
//    let screenFactory: ScreenFactory
//    
//    init() {
//        session = URLSession.shared
//        decoder = JSONDecoder()
//        loader = Loader(session: session, decoder: decoder)
//        
//        screenFactory = ScreenFactory()
//        screenFactory.di = self
//    }
//}
//
////Контейнер для создания всех экранов
//final class ScreenFactory {
//    
//    weak var di: DependencyContainer!
//
//    func makeHomescreen() -> HomeVC {
//        return HomeVC(homeLoader: di.loader)
//    }
//    
//    func makeShopScreen() -> ShopVC {
//        return ShopVC(loader: di.loader)
//    }
//    
//    func makeFavoriteScreen() -> FavoritesVC {
//        return FavoritesVC(loader: di.loader)
//    }
//    
//    func makeBagVC() -> BagVC {
//        return BagVC(loader: di.loader)
//    }
//    
//    func makeDetailScreen() -> DetailVC {
//        return DetailVC()
//    }
//}
//
//
////SRP
////-> Module Configure
////final class HomeConfigurator {
////    func configure() -> HomeVC {
////
////        let session = URLSession.shared
////        let decoder = JSONDecoder()
////
////        let productsLoader = TopPicksLoader(session: session, decoder: decoder)
////        let homeVC = HomeVC.init(productsLoader: productsLoader)
////
////        return homeVC
////    }
////}
//

// Пример реализации в таб бар

//let di = DependencyContainer()
//
//class TabBarController: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        let homeVC = HomeConfigurator().configure()
////        let shopVC = ShopConfigurator().configure()
////        let favoriteVC = FavoritesConfigurator().configure()
////
//        let homeVC = di.screenFactory.makeHomescreen()
//        let shopVC = di.screenFactory.makeShopScreen()
//        let favoriteVC = di.screenFactory.makeFavoriteScreen()
//        let bagVC = di.screenFactory.makeBagVC()
//
//
//        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
//        shopVC.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(systemName: "square"), tag: 1)
//        favoriteVC.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "house"), tag: 2)
//        bagVC.tabBarItem = UITabBarItem(title: "Bag", image: UIImage(systemName: "square"), tag: 3)
//
//        let tabBarList = [homeVC, shopVC, favoriteVC, bagVC]
//        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        self.selectedIndex = 1
//    }
//}

// MARK: - Models
// import UIKit

//struct RootModel: Decodable {
//    let headers: HeadersModel
//    let topPicks: [TopPickModel]
//    let pageControl: [PageControlModel]
//    let listModel: [ListModel]
//    let productCategory1: ProductCategory1Model
//    let alwaysPopular: [AlwaysPopularModel]
//    let productCategory2: [TopPickModel]
//    let thankYou: [ThankYouModel]
//    let shoes: [Categories]
//    let detailButtonsName: DetailButtonsModel
//    let shopButtons: ShopButtonsModel
//    let youMightAlsoLike: [ThankYouModel]
//    let promotionModel: [PromotionModel]
//}
//
//struct ProductCategory1Model: Decodable {
//    let firstCollection: [TopPickModel]
//    let secondCollection: [TopPickModel]
//}
//
//struct PageControlModel: Decodable, Encodable {
//    let image: String
//    let title: String
//    let description: String
//}
//
//struct ListModel: Decodable, Encodable {
//    let videoURL: String?
//    let image: String?
//}
//
//struct AlwaysPopularModel: Decodable {
//    let largeImage: String
//    let smallImage1: String
//    let smallImage2: String
//    
//    let largeImageLabel1: String
//    let largeImageLabel2: String
//    
//    let smallImage1Label1: String
//    let smallImage1Label2: String
//    let smallImage2Label1: String
//    let smallImage2Label2: String
//    
//    let title: String
//    let rightButtonTitle: String
//    let bottomButtonTitle: String
//}
//
//struct ThankYouModel: Codable {
//    let image: String
//}
//
//struct TopPickModel: Codable {
//    let id: Int
//    var count: Int
//    let image: String
//    let description: String
//    let type: String
//    let price: String
//    let categories: [Categories]?
//    let listCategories: [ListModel]?
//    let categoryName: String?
//    let detailButtonsName: DetailButtonsModel?
//    let pagecontrolModel: [PageControlModel]?
//    let youMightAlsoLike: [ThankYouModel]?
//}
//
//struct Categories: Decodable, Encodable {
//    let image2: String
//    let subCategories: [SubCategoryModel]
//}
//
//struct SubCategoryModel: Decodable, Encodable {
//    let image3: String
//    let currentSubCategory: String?
//}
//
//struct DetailButtonsModel: Decodable, Encodable {
//    let firstButtonTitle: String
//    let seconrButtonTitle: String
//}
//
//struct ShopButtonsModel: Decodable {
//    let firstButtonTitle: String
//    let seconrButtonTitle: String
//    let thirdButtonTitle: String
//}
//
//struct PromotionModel: Decodable {
//    let label: String?
//}



//struct RootModel2: Decodable {
//    let product: [Product]
//}
//
//
//
//struct Product: Codable {
//    let id: Int
//    let name: String
//    let price: Int
//    var count: Int
//}
//
//
//struct MockData {
//    static let products: [Product] = [
//        Product(id: 1, name: "Product 1", price: 100, count: 1),
//        Product(id: 2, name: "Product 2", price: 200, count: 2),
//        Product(id: 3, name: "Product 3", price: 300, count: 3)
//    ]
//}

//struct TopPickModel: Decodable {
//    let image: String
//    let description: String
//    let type: String
//    let price: String
//    let categories: [Categories]?
//    let listCategories: [ListModel]?
//    let categoryName: String?
//    let detailButtonsName: DetailButtonsModel?
//    let pagecontrolModel: [PageControlModel]?
//}




// MARK: -


// MARK: -

// MARK: -

// MARK: -

// MARK: -

// MARK: -

// MARK: -

// MARK: -

// MARK: -

// MARK: -

// MARK: -

// MARK: -

