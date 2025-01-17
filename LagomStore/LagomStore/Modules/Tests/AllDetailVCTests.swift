//
//  AllDetailVCTests.swift
//  LagomStore
//
//  Created by Александр Милейчик on 1/6/25.
//

//import UIKit

// 1.
//
//class DetailVC: UIViewController {
//    
//    var tableView = DetailTableView()
//    
//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupViews()
//        setupConstraints()
//    }
//}
//
//// MARK: - Business Logic
//extension DetailVC {
//    
//    func updateWithCategory(_ topPicksModel: [TopPickModel], category: String) {
//        
//        guard let subCategories = topPicksModel.first?.categories?.first?.subCategories else { return }
//        let categories = topPicksModel.filter { $0.categoryName == category }
//        guard let buttonsTitles = topPicksModel.first?.detailButtonsName else { return }
//        guard let pageControlData = topPicksModel.first?.pagecontrolModel else { return }
////        guard let listCellData = topPicksModel.first?.listCategories else { return }
//        
//        guard let youMightAlsoLikeData = topPicksModel.first?.youMightAlsoLike else { return }
//
//        
//        let topPickModels = topPicksModel.filter { $0.id != 0 }
//        
//        let firstTopPickModel = topPickModels.first
//        
//
//        tableView.dataModels = [
//            .pageControl(subCategories),
//            .productOptions(categories),
//            .detailButtons(buttonsTitles, model: firstTopPickModel!),
//            .pageControlwithDuration(pageControlData),
//            .productDescription,
//            .expandableSection,
//            .youMightAlsoLike(youMightAlsoLikeData)
//        ]
//        tableView.reloadData()
//    }
//    
//    func updateWithCategory2(_ pageControlModel: [PageControlModel]) {
//      
//        let data = pageControlModel
//
//        tableView.dataModels = [
// //           .pageControl(subCategories),
////            .productOptions(categories),
////            .detailButtons(buttonsTitles),
////            .expandableSection,
//            .pageControlwithDuration(data),
////            .listSection(data)
////            .thankYou(data)
//        ]
//        tableView.reloadData()
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



// 2.
//import UIKit
//
//class DetailTableView: UITableView {
//    
//    var pageControlCurrentPage: Int = 0
//    private var expandedIndexPaths: Set<IndexPath> = []
//    
//    var ordersService: OrdersServiceProtocol = OrdersService()
//    private let loader: ILoader2 = MockLoader()
//    
//    
//    var dataModels: [DetailSections] = []
//    var shoes: [Categories] = []
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
//        translatesAutoresizingMaskIntoConstraints = false
//        delegate = self
//        dataSource = self
//        separatorStyle = .none
//        allowsSelection = false
//        
//        registerCell(DetailVCPageControlTableViewCell.self)
//        registerCell(CategoriesTableViewCell.self)
//        registerCell(DetailButtons.self)
//        registerCell(PageControlCell.self)
//        registerCell(ExpandableCell.self)
//        registerCell(OrthogonalContainerCell.self)
//        registerCell(NearbyStoresCell.self)
//        registerCell(ProductDescription.self)
//    }
//    
//    
//    func updateFirstSection(with topPicks: [SubCategoryModel], category: String) {
//        if !topPicks.isEmpty {
//            dataModels[0] = .pageControl(topPicks)
//            reloadData()
//        } else {
//            print("No categories: \(category)")
//        }
//    }
//}
//
//extension DetailTableView: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        if expandedIndexPaths.contains(indexPath) {
//            // Увеличенная высота для развернутой ячейки
//            return 100
//        }
//        
//        let sections = dataModels[indexPath.section]
//        switch sections {
//        case .pageControl:
//            return 515
//        case .productOptions:
//            return 125
//        case .detailButtons:
//            return 150
//        case .pageControlwithDuration:
//            return 150
//        case .productDescription:
//            return 350
//        case .expandableSection:
//            return 50
//        case .youMightAlsoLike:
//            return 275
//        }
//    }
//}
//
//extension DetailTableView: UITableViewDataSource {
//    enum DetailSections {
//        case pageControl([SubCategoryModel])
//        case productOptions([TopPickModel])
//        case detailButtons(DetailButtonsModel, model: TopPickModel)
//        case pageControlwithDuration([PageControlModel])
//        case productDescription
//        case expandableSection
//        case youMightAlsoLike([ThankYouModel])
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return dataModels.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let sections = dataModels[section]
//        switch sections {
//        case .expandableSection:
//            return 2 // Две строки в новой секции
//        default:
//            return 1
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let detailSectionsData = dataModels[indexPath.section]
//        
//        switch detailSectionsData {
//        case .pageControl(let model):
//            
//            let cell = tableView.dequeuCell(indexPath) as DetailVCPageControlTableViewCell
//            cell.updateTest(model)
//            
//            return cell
//            
//        case .productOptions(let models):
//            
//            let cell = tableView.dequeuCell(indexPath) as CategoriesTableViewCell
//            cell.delegate = self
//            
//            let shoesCategory = models.compactMap { $0.categories }.flatMap {$0}
//            
//            cell.updateCategories(shoesCategory)
//            
//            return cell
//            
//        case .detailButtons(let model, model: let model2):
//            
//            let cell = tableView.dequeuCell(indexPath) as DetailButtons
//            
//            cell.update(model, topPickModel: model2)
//            
//            cell.onFavoriteButton = {
//                
//                self.ordersService.saveAndAdd([model2])
//                
//                self.ordersService.printtopPickStorage()
//            }
//            
//            return cell
//            
//        case .pageControlwithDuration(let model):
//            
//            let cell = tableView.dequeuCell(indexPath) as PageControlCell
//            
//            let sectionHeight: CGFloat = 150
//            cell.update(model, sectionHeight: sectionHeight)
//            cell.isAutoScrollingEnabled = true
//            
//            return cell
//        
//        case .productDescription:
//           
//            let cell = tableView.dequeuCell(indexPath) as ProductDescription
//           
//            cell.configure(withText: "The Nike Air Jordan sneakers combine iconic style with modern performance, making them a favorite both on and off the court. Known for their premium materials, the Jordans feature a mix of leather and synthetic uppers for durability and a sleek look. The cushioned midsole and Nike Air technology provide exceptional comfort and support for all-day wear. With their bold design and classic Jumpman logo, these sneakers are a statement piece in any wardrobe. The Air Jordan model is a perfect blend of heritage, innovation, and streetwear culture",
//                           buttonTitle: "View Product Details")
//            return cell
//            
//        case .expandableSection:
//            
//            let cell = tableView.dequeuCell(indexPath) as ExpandableCell
//            let isExpanded = expandedIndexPaths.contains(indexPath)
//            
//            if indexPath.row == 0 {
//                cell.configure(with: "Контент для первой строки", buttonTitle: "Кнопка 1", isExpanded: isExpanded)
//            } else {
//                cell.configure(with: "Лейбл 1 для второй строки", buttonTitle: "Кнопка 2", additionalLabel: "Лейбл 2 для второй строки", isExpanded: isExpanded)
//            }
//            
//            cell.expandButtonTapped = { [weak self] in
//                self?.handleExpand(for: indexPath)
//            }
//            return cell
//        
//        case .youMightAlsoLike(let model):
//            
//            let cell = tableView.dequeuCell(indexPath) as NearbyStoresCell
//            cell.update(.nearbyStoreSectionData(models: model), sectionHeight: 300)
////            cell.configureHeader(with: header)
//            return cell
//        }
//    }
//    // Метод обработки развертывания
//    func handleExpand(for indexPath: IndexPath) {
//        if expandedIndexPaths.contains(indexPath) {
//            expandedIndexPaths.remove(indexPath)
//        } else {
//            expandedIndexPaths.insert(indexPath)
//        }
//        reloadRows(at: [indexPath], with: .automatic)
//    }
//}
//
//extension DetailTableView: TableViewCellDelegate {
//    func didSelectItem(with model: [SubCategoryModel], subCategory: String) {
//        updateFirstSection(with: model, category: subCategory)
//        print("\(subCategory)")
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
//
//
////
////import UIKit
////
////class DetailTableView: UITableView {
////
////    var pageControlCurrentPage: Int = 0
////    var dataModels: [DetailSections] = []
////    var shoes: [Categories] = []
////
////    // Хранение развернутых ячеек
////    private var expandedIndexPaths: Set<IndexPath> = []
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
////        translatesAutoresizingMaskIntoConstraints = false
////        delegate = self
////        dataSource = self
////        separatorStyle = .none
////        allowsSelection = false
////
////        registerCell(DetailVCPageControlTableViewCell.self)
////        registerCell(CategoriesTableViewCell.self)
////        registerCell(DetailButtons.self)
////        registerCell(PageControlCell.self)
////        registerCell(ExpandableCell.self)
////        registerCell(HomeListCell.self)
////        registerCell(ThankYouCell.self)
////    }
////
////    func updateFirstSection(with topPicks: [SubCategoryModel], category: String) {
////        if !topPicks.isEmpty {
////            dataModels[0] = .pageControl(topPicks)
////            reloadData()
////        } else {
////            print("No categories: \(category)")
////        }
////    }
////}
////
////extension DetailTableView: UITableViewDelegate {
//////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//////
//////        if expandedIndexPaths.contains(indexPath) {
//////            // Увеличенная высота для развернутой ячейки
//////            return 100
//////        }
//////
//////        let sections = dataModels[indexPath.section]
//////        switch sections {
//////        case .pageControl:
//////            return 515
//////        case .productOptions:
//////            return 125
//////        case .detailButtons:
//////            return 150
//////        case .pageControlwithDuration:
//////            return 200
//////        case .expandableSection:
//////            return 50
//////        case .listSection:
//////            return 1650
//////        }
//////    }
////}
////
////extension DetailTableView: UITableViewDataSource {
////    enum DetailSections {
////        case pageControl([SubCategoryModel])
////        case productOptions([TopPickModel])
////        case detailButtons(DetailButtonsModel)
////        case pageControlwithDuration([PageControlModel])
////        case expandableSection // Новый case для секции с двумя строками
////        case listSection([ListModel])
////        case thankYou([ThankYouModel])
////    }
////
////    func numberOfSections(in tableView: UITableView) -> Int {
////        return dataModels.count
////    }
////
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        let sections = dataModels[section]
////        switch sections {
////        case .expandableSection:
////            return 2 // Две строки в новой секции
////        default:
////            return 1
////        }
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let detailSectionsData = dataModels[indexPath.section]
////
////        switch detailSectionsData {
////        case .pageControl(let model):
////
////            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailVCPageControlTableViewCell", for: indexPath) as! DetailVCPageControlTableViewCell
////            cell.update(model, collectionViewHeight: 400)
////
////            return cell
////
////        case .productOptions(let models):
////            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as! CategoriesTableViewCell
////            cell.delegate = self
////            let shoesCategory = models.compactMap { $0.categories }.flatMap { $0 }
////            cell.updateCategories(shoesCategory)
////            return cell
////
////        case .detailButtons(let model):
////            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailButtons", for: indexPath) as! DetailButtons
////            cell.update(model)
////            return cell
////
////        case .pageControlwithDuration(let model):
////            let cell = tableView.dequeueReusableCell(withIdentifier: "PageControlCell", for: indexPath) as! PageControlCell
////            cell.update(model)
////            return cell
////
////        case .expandableSection:
////            let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell", for: indexPath) as! ExpandableCell
////            let isExpanded = expandedIndexPaths.contains(indexPath)
////
////            if indexPath.row == 0 {
////                cell.configure(with: "Контент для первой строки", buttonTitle: "Кнопка 1", isExpanded: isExpanded)
////            } else {
////                cell.configure(with: "Лейбл 1 для второй строки", buttonTitle: "Кнопка 2", additionalLabel: "Лейбл 2 для второй строки", isExpanded: isExpanded)
////            }
////
////            cell.expandButtonTapped = { [weak self] in
////                self?.handleExpand(for: indexPath)
////            }
////            return cell
////
////        case .listSection(let model):
////
////            let cell = tableView.dequeuCell(indexPath) as HomeListCell
////            cell.update(model, heights: [400, 400, 400, 400], gradientIndexes: [])
////
////            let tableViewHeight: CGFloat = 1650
////            cell.updateTableViewHeight(tableViewHeight)
////
////            return cell
////
////        case .thankYou(let model):
////
////            let cell = tableView.dequeuCell(indexPath) as ThankYouCell
////            let data = model[indexPath.item]
////            cell.update(data)
////            return cell
////        }
////    }
////
////    // Метод обработки развертывания
////    func handleExpand(for indexPath: IndexPath) {
////        if expandedIndexPaths.contains(indexPath) {
////            expandedIndexPaths.remove(indexPath)
////        } else {
////            expandedIndexPaths.insert(indexPath)
////        }
////        reloadRows(at: [indexPath], with: .automatic)
////    }
////}
////
////extension DetailTableView: TableViewCellDelegate {
////    func didSelectItem(with model: [SubCategoryModel], subCategory: String) {
////        updateFirstSection(with: model, category: subCategory)
////    }
////}
////
////
////
//


// 3.
//class DetailVCPageControlTableViewCell: UITableViewCell {
//    
//    var subCategories: [SubCategoryModel] = []
//    
//    private var currentPage: Int = 0
//    private var collectionViewHeightConstraint: NSLayoutConstraint!
//
//    private lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 0
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.isPagingEnabled = true
//        
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        
//        collectionView.registerCell(DetailVCPageControlCollectionViewCell.self)
//        
//        return collectionView
//    }()
//    
//    private lazy var pageControl: UIPageControl = {
//        let control = UIPageControl()
//        control.currentPageIndicatorTintColor = .black
//        control.pageIndicatorTintColor = .gray
//        control.numberOfPages = subCategories.count
//        return control
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupViews()
//        setupConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupViews() {
//        contentView.addSubview(collectionView)
//        contentView.addSubview(pageControl)
//        
//        collectionView.contentInset = .zero
////        pageControlCollectionView.layer.borderColor = UIColor.red.cgColor
////        pageControlCollectionView.layer.borderWidth = 1
//    }
//    
//    private func setupConstraints() {
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        
//        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 0)
//
//        NSLayoutConstraint.activate([
//            
////            pageControlCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
////            pageControlCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
////            pageControlCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//  //          pageControlCollectionView.heightAnchor.constraint(equalToConstant: 515),
//            
//            
//            
//            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            collectionView.heightAnchor.constraint(equalToConstant: 515),
//
//            
//   //         collectionViewHeightConstraint,
//
//            
//            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            pageControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
//        ])
//    }
//    
//    func update(_ model: [SubCategoryModel], collectionViewHeight: CGFloat) {
//        self.subCategories = model
//        pageControl.numberOfPages = model.count
//        
//        collectionViewHeightConstraint.constant = collectionViewHeight
//
//        collectionView.reloadData()
//        scrollToCurrentPage()
//    }
//    
//    func updateTest(_ model: [SubCategoryModel]) {
//        self.subCategories = model
//        pageControl.numberOfPages = model.count
//        
//        collectionView.reloadData()
//        scrollToCurrentPage()
//    }
//    
//    
//    private func scrollToCurrentPage() {
//        guard currentPage < subCategories.count else { return }
//        let indexPath = IndexPath(item: currentPage, section: 0)
//        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
//    }
//    
////    override func prepareForReuse() {
////        super.prepareForReuse()
////
////        // Сбрасываем данные
////        subCategories = []
////        currentPage = 0
////
////        // Обновляем pageControl
////        pageControl.numberOfPages = 0
////        pageControl.currentPage = 0
////
////        // Очищаем collectionView
////        pageControlCollectionView.reloadData()
////    }
//}
//
//extension DetailVCPageControlTableViewCell: UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return subCategories.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeuCell(indexPath) as DetailVCPageControlCollectionViewCell
//        let data = subCategories[indexPath.item]
//        cell.updatePageControl(data)
//        
//        return cell
//    }
//}
//
//extension DetailVCPageControlTableViewCell: UIScrollViewDelegate {
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let pageWidth = scrollView.frame.size.width
//        currentPage = Int(scrollView.contentOffset.x / pageWidth)
//        pageControl.currentPage = currentPage
//    }
//}
//
//extension DetailVCPageControlTableViewCell: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
//    }
//}

// 4.
//protocol TableViewCellDelegate: AnyObject {
//    func didSelectItem(with model: [SubCategoryModel], subCategory: String)
//}
//
//class CategoriesTableViewCell: UITableViewCell {
//    
//    weak var delegate: TableViewCellDelegate?
//    
//    private var categories: [Categories] = []
//    private var subCategory: [SubCategoryModel] = []
//    
////    weak var viewcontroller: UIViewController?
//    
//    private lazy var categoriesCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.registerCell(CategoriesCollectionViewCell.self)
//        
//        return collectionView
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupViews()
//        setupConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupViews() {
//        contentView.addSubview(categoriesCollectionView)
//    }
//    
//    func setupConstraints() {
//        categoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            categoriesCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            categoriesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            categoriesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 125),
//        ])
//    }
//    
//    func updateCategories(_ model: [Categories]) {
//        self.categories = model
//        self.subCategory = model.first?.subCategories ?? []
//        //        self.subCategory = model[0].subCategories
//        categoriesCollectionView.reloadData()
//    }
//    
////    override func prepareForReuse() {
////        super.prepareForReuse()
////
////        // Сброс данных
////        categories = []
////        subCategory = []
////
////        // Перезагрузка коллекции
////        categoriesCollectionView.reloadData()
////
////        // Сброс делегата, если требуется
////        delegate = nil
////    }
//}
//
//extension CategoriesTableViewCell: UICollectionViewDelegate {
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedSubCategory = categories[indexPath.item].subCategories
//        let subCategoryName = categories[indexPath.item].subCategories.first?.currentSubCategory ?? ""
//        
//        delegate?.didSelectItem(with: selectedSubCategory, subCategory: subCategoryName)
//    }
//}
//
//extension CategoriesTableViewCell: UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return categories.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeuCell(indexPath) as CategoriesCollectionViewCell
//        let data = categories[indexPath.item]
//        cell.updateCategories(data)
//        
//        return cell
//    }
//}
//
//extension CategoriesTableViewCell: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 100)
//    }
//    
//    // Отступы между строками ячеек (по вертикали)
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 6
//    }
//    
//    //     Отступы между элементами в строке (по горизонтали)
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
////        return 6
////    }
//    
//    // Отступы от края коллекции
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
//    }
//}


// 5.
//class ProductDescription: UITableViewCell {
//    
//    private let customLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Пример текста"
//        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private let customButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        
//        // Установка атрибутированного текста с подчеркиванием
//        let title = "Нажать"
//        let attributes: [NSAttributedString.Key: Any] = [
//            .font: UIFont.systemFont(ofSize: 14),
//            .underlineStyle: NSUnderlineStyle.single.rawValue
//        ]
//        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
//        button.setAttributedTitle(attributedTitle, for: .normal)
//        
//        return button
//    }()
//    
//    private let underlineView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .red // Цвет подчеркивания
//        return view
//    }()
//
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupViews()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) не был реализован")
//    }
//    
//    // MARK: - Настройка UI
////    private func setupViews() {
////        contentView.addSubview(customLabel)
////        contentView.addSubview(customButton)
////        contentView.addSubview(underlineView) // Добавляем подчеркивание
////
////        NSLayoutConstraint.activate([
////            // Constraints для label
////            customLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
////            customLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
////            customLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
////
////            // Constraints для кнопки
////            customButton.topAnchor.constraint(equalTo: customLabel.bottomAnchor, constant: 16),
////            customButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
////
////            // Подчеркивание (underlineView)
////            underlineView.topAnchor.constraint(equalTo: customButton.bottomAnchor, constant: 2), // Отступ 2
////            underlineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
////            underlineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
////            underlineView.heightAnchor.constraint(equalToConstant: 1), // Толщина линии
////
////            // Нижний отступ contentView
////            underlineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
////        ])
////    }
//    
//    private func setupViews() {
//        contentView.addSubview(customLabel)
//        contentView.addSubview(customButton)
//        contentView.addSubview(underlineView) // Добавляем линию
//
//        NSLayoutConstraint.activate([
//            // Constraints для label
//            customLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            customLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
//            customLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//
//            // Constraints для кнопки
//            customButton.topAnchor.constraint(equalTo: customLabel.bottomAnchor, constant: 16),
//            customButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//
//            // Constraints для underlineView (линии)
//            underlineView.topAnchor.constraint(equalTo: customButton.bottomAnchor, constant: 4), // Отступ от текста
//            underlineView.leadingAnchor.constraint(equalTo: customButton.leadingAnchor),
//            underlineView.trailingAnchor.constraint(equalTo: customButton.trailingAnchor),
//            underlineView.heightAnchor.constraint(equalToConstant: 1), // Толщина линии
//
//            // Нижний отступ contentView
//            underlineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
//        ])
//    }
//    
//    func configure(withText text: String, buttonTitle: String) {
//        customLabel.text = text
//        customButton.setTitle(buttonTitle, for: .normal)
//    }
//}
//
//
