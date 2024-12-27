//
//  OrthogonalTestCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/24/24.
//

import Foundation
//
//import UIKit
//
//protocol OrthogonalContainerCellDelegate: AnyObject {
//    func didSelectItem(with model: [TopPickModel], category: String)
//    func didSelectItem2(with model: [PageControlModel])
////    func didSelectItem(with model: Any, category: String? )
//}
//
//enum CellDataType {
//    case topPicks(_ model: [TopPickModel])
//    case thisWeekTopStories(_ model: [TopPickModel])
//    case productCategory2(_ model: [PageControlModel])
//    
//    var itemSize: CGSize {
//        switch self {
//        case .topPicks:
//            return CGSize(width: 150, height: 285)
//        case .thisWeekTopStories:
//            return CGSize(width: 225, height: 235)
//        case .productCategory2:
//            return CGSize(width: 225, height: 225)
//        }
//    }
//}
//
//class OrthogonalContainerCell: UITableViewCell {
//    
//    weak var delegate: OrthogonalContainerCellDelegate?
//    private var dataType: CellDataType?
//    var onRemoveSection: (() -> Void)?
//    
//    private lazy var titleLabel = Label(type: .name)
//    private lazy var subtitleLabel = Label(type: .description)
//    private let headerStackView = StackView(type: .headerStackView)
//        
//    private lazy var actionButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitleColor(.black, for: .normal)
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        return button
//    }()
//    
//    private lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.showsHorizontalScrollIndicator = false
//        
//        collectionView.registerCell(TestCollectionViewCell.self)
//        collectionView.registerCell(CategoriesCollectionViewCell.self)
//        collectionView.registerCell(UniversalCollectionViewCell.self)
//        collectionView.registerCell(NearbyStoresCollectionViewCell.self)
//        collectionView.registerCell(PageControlCollectionViewCell.self)
//        collectionView.registerCell(NewAndFeaturedCellCollectionViewCell.self)
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
//    
//    func update(dataType: CellDataType, height: CGFloat) {
//        self.dataType = dataType
//        if let heightConstraint = collectionView.constraints.first(where: { $0.firstAttribute == .height }) {
//            heightConstraint.constant = height
//            heightConstraint.priority = .defaultHigh
//        }
//        collectionView.reloadData()
//    }
//    
//    func update1(dataType: CellDataType) {
//        self.dataType = dataType
//        collectionView.reloadData()
//    }
//    
//    func update(_ model: UniversalHeaderModel?) {
//        titleLabel.text = model?.firstLabelText
//        subtitleLabel.text = model?.subtitleLabel
//        actionButton.setTitle(model?.buttonTitle, for: .normal)
//    }
//    
//    func update(_ model: TitleHeaderModel?) {
//        titleLabel.text = model?.title
//        subtitleLabel.text = model?.subtitleLabel
//        actionButton.setTitle(model?.buttonTitle, for: .normal)
//    }
//    
//    func configureThisWeekHeader(with header: ThisWeekHeader?) {
//        titleLabel.text = header?.firstLabelText
//    }
//    
//    @objc private func buttonTapped() {
////        UIView.animate(withDuration: 0.3, animations: {
////            self.alpha = 0
////        }, completion: { _ in
////            self.onRemoveSection?()
////        })
//        onRemoveSection?()
//    }
//    
//    
//    
////    override func prepareForReuse() {
////        super.prepareForReuse()
////
////        // Очистка текста заголовков
////        titleLabel.text = nil
////        subtitleLabel.text = nil
////        actionButton.setTitle(nil, for: .normal)
////
////        // Сброс делегата и типа данных
////        delegate = nil
////        dataType = nil
////
////        // Скрытие или сброс headerStackView, если он не должен быть показан
////        headerStackView.isHidden = false
////
////        // Перезагрузка collectionView, чтобы удалить старые данные
////        collectionView.delegate = self
////        collectionView.dataSource = self
////
////        collectionView.reloadData()
////    }
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        titleLabel.text = nil
//        subtitleLabel.text = nil
//        actionButton.setTitle(nil, for: .normal)
//        dataType = nil
//        collectionView.reloadData()
//    }
//}
//
//// MARK: - UICollectionViewDelegate
//extension OrthogonalContainerCell: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let dataType = dataType else { return }
//        switch dataType {
//            
//        case .topPicks(let models):
//            let model = models[indexPath.item]
//            let category = model.categoryName ?? ""
//            delegate?.didSelectItem(with: [model], category: category)
//            
//        case .thisWeekTopStories(let models):
//            let model = models[indexPath.item]
//            let category = model.categoryName ?? ""
//            delegate?.didSelectItem(with: [model], category: category)
//        
//        case .productCategory2(models: let models):
//            let model = models[indexPath.item]
//            delegate?.didSelectItem2(with: [model])
//        }
//    }
//}
//
//// MARK: - UICollectionViewDataSource
//extension OrthogonalContainerCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        guard let dataType = dataType else { return 0 }
//        switch dataType {
//            
//        case .topPicks(let models):
//            return models.count
//            
//        case .thisWeekTopStories(let models):
//            return models.count
//        
//        case .productCategory2(models: let models):
//            return models.count
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let dataType = dataType else { return UICollectionViewCell() }
//        switch dataType {
//            
//        case .topPicks(let models):
//            let cell = collectionView.dequeuCell(indexPath) as UniversalCollectionViewCell
//            let data = models[indexPath.item]
//            cell.update(section: .topPicks(models: [data]))
//            return cell
//            
//        case .thisWeekTopStories(let models):
//            let cell = collectionView.dequeuCell(indexPath) as NewAndFeaturedCellCollectionViewCell
//            let data = models[indexPath.item]
// //           cell.update(section: .thisWeekTopStories(models: [data]))
//            cell.updateNewAndFeaturedSection(data)
//            return cell
//            
//        case .productCategory2(models: let models):
//            let cell = collectionView.dequeuCell(indexPath) as PageControlCollectionViewCell
//            let data = models[indexPath.item]
//            cell.updatePageControl(data)
// //           cell.update(section: .productCategory2(models: [data]))
//            return cell
//        }
//    }
//}
//
//// MARK: - UICollectionViewDelegateFlowLayout
//extension OrthogonalContainerCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return dataType?.itemSize ?? .zero
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 24, left: 24, bottom: 0, right: 24)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 16
//    }
//}
//
//// MARK: - Layout
//private extension OrthogonalContainerCell {
//    
//    func setupViews() {
//        contentView.addSubview(headerStackView)
//        contentView.addSubview(actionButton)
//        contentView.addSubview(collectionView)
//        
//        headerStackView.addArrangedSubview(titleLabel)
//        headerStackView.addArrangedSubview(subtitleLabel)
//    }
//    
//    func setupConstraints() {
//        
////        var heightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 400)
////        heightConstraint.priority = .defaultHigh
////        heightConstraint.isActive = true
//        
//        NSLayoutConstraint.activate([
//            headerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            headerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
//            
//            collectionView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//           
//            collectionView.heightAnchor.constraint(equalToConstant: 0),
//  //          collectionView.heightAnchor.constraint(equalToConstant: 300),
//            
//            actionButton.topAnchor.constraint(equalTo: contentView.topAnchor),
//            actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
//            actionButton.widthAnchor.constraint(equalToConstant: 75),
//            actionButton.heightAnchor.constraint(equalToConstant: 35)
//        ])
//        
//
//    }
//}
//
//





//protocol TopPicksCellDelegate: AnyObject {
//    func didSelectItem(with model: [TopPickModel], category: String)
//}
//
//enum CellDataType {
//    case topPicks
//}
//
//class OrthogonalContainerCell: UITableViewCell {
//
//    weak var delegate: TopPicksCellDelegate?
//    private var dataSource: [Any] = []
//    private var dataType: CellDataType?
//    private var collectionViewHeightConstraint: NSLayoutConstraint!
//    var onRemoveSection: (() -> Void)?
//
//    private lazy var titleLabel = Label(type: .title)
//    private lazy var subtitleLabel = Label(type: .subtitle)
//    private let headerStackView = StackView(type: .headerStackView)
//
//    private lazy var actionButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitleColor(.black, for: .normal)
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        return button
//    }()
//
//    private lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//
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
//        setupConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func update(with model: [Any], type: CellDataType, collectionViewHeight: CGFloat) {
//        self.dataSource = model
//        self.dataType = type
//
//        collectionViewHeightConstraint.constant = collectionViewHeight
//        collectionView.reloadData()
//    }
//
//    func configureHeader(with header: UniversalHeaderModel) {
//        titleLabel.text = header.firstLabelText
//        subtitleLabel.text = header.subtitleLabel
//        actionButton.setTitle(header.buttonTitle, for: .normal)
//    }
//
//    @objc private func buttonTapped() {
//        onRemoveSection?()
//    }
//}
//
//extension OrthogonalContainerCell: UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let dataType = dataType else { return }
//        switch dataType {
//
//        case .topPicks:
//            guard let model = dataSource[indexPath.item] as? TopPickModel else { return }
//            let category = model.categoryName ?? ""
//            delegate?.didSelectItem(with: [model], category: category)
//        }
//    }
//}
//
//extension OrthogonalContainerCell: UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dataSource.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let dataType = dataType else { return UICollectionViewCell() }
//
//        switch dataType {
//
//        case .topPicks:
//
//            let cell = collectionView.dequeuCell(indexPath) as TopPicksCollectionViewCell
//            let data = dataSource[indexPath.item]
//            cell.updateTopPicks(data as! TopPickModel)
//
//            return cell
//        }
//    }
//}
//
//extension OrthogonalContainerCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        guard let dataType = dataType else { return CGSize()}
//        switch dataType {
//
//        case .topPicks:
//            return CGSize(width: 150, height: 265)
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
//
//
////MARK: - Layout
//private extension OrthogonalContainerCell {
//
//    private func setupViews() {
//        contentView.addSubview(headerStackView)
//        contentView.addSubview(actionButton)
//        contentView.addSubview(collectionView)
//
//        headerStackView.addArrangedSubview(titleLabel)
//        headerStackView.addArrangedSubview(subtitleLabel)
//
//    }
//
//    func setupConstraints() {
//        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 0)
//
//        NSLayoutConstraint.activate([
//
//            headerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            headerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
//
//            collectionView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 0),
//            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
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
//}













//protocol TopPicksCellDelegate: AnyObject {
//    func didSelectItem(with model: [TopPickModel], category: String)
//}
//
//enum CellDataType {
//    case topPicks([TopPickModel])
////    case categories
////    case thisWeekTopStories
////    case recentlyViewed
////    case newAndFeatured
////    case nearbyStore
//}



//class OrthogonalContainerCell: UITableViewCell {
//
//    weak var delegate: TopPicksCellDelegate?
//
//    private var topPicksProducts:          [TopPickModel] = []
//    private var categories:                [Categories] = []
//    private var thisWeekTopStoriesData:    [TopPickModel] = []
//    private var newAndFeaturedData:        [TopPickModel] = []
//    private var recentlyViewedData:        [TopPickModel] = []
//    private var nearbyStoreSectionData:    [TopPickModel] = []
//
//    private var dataType: CellDataType = .topPicks
//
//    private var collectionViewHeightConstraint: NSLayoutConstraint!
//
//    var onRemoveSection: (() -> Void)?
//
//    private lazy var titleLabel = Label(type: .title)
//    private lazy var subtitleLabel = Label(type: .subtitle)
//    private let headerStackView = StackView(type: .headerStackView)
//
//    private lazy var actionButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitleColor(.black, for: .normal)
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        return button
//    }()
//
//    private lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//  //      layout.itemSize = CGSize(width: 200, height: 100)
//        layout.scrollDirection = .horizontal
//
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//
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
//        setupConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func updateTopPicks(_ model: [TopPickModel], _ header: UniversalHeaderModel, _ collectionViewHeight: CGFloat) {
//
//        self.topPicksProducts = model
//        self.dataType = .topPicks
//
//        titleLabel.text = header.firstLabelText
//        subtitleLabel.text = header.subtitleLabel
//        actionButton.setTitle(header.buttonTitle, for: .normal)
//
//        collectionViewHeightConstraint.constant = collectionViewHeight
//
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
//
//    func update2(_ model: [TopPickModel]) {
//        self.topPicksProducts = model
//        self.dataType = .topPicks
//        collectionView.reloadData()
//    }
//
//    func updateS(_ model: [Categories]) {
//        self.categories = model
//        self.dataType = .categories
//        collectionView.reloadData()
//    }
//
//    @objc private func buttonTapped() {
//        onRemoveSection?()
//    }
//}
//
//extension OrthogonalContainerCell: UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        switch dataType {
//
//        case .topPicks:
//            let selectedModel = topPicksProducts[indexPath.item]
//            let categoryName = selectedModel.categoryName ?? ""
//            delegate?.didSelectItem(with: [selectedModel], category: categoryName)
//
//        case .categories:
//            _ = categories[indexPath.item]
//
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
//
//        case .topPicks:
//            return topPicksProducts.count
//
//        case .categories:
//            return categories.count
//
//        case .thisWeekTopStories:
//            return thisWeekTopStoriesData.count
//
//        case .recentlyViewed:
//            return recentlyViewedData.count
//
//        case .newAndFeatured:
//            return newAndFeaturedData.count
//
//        case .nearbyStore:
//            return nearbyStoreSectionData.count
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        switch dataType {
//
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
//}
//
//extension OrthogonalContainerCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        switch dataType {
//
//        case .topPicks:
//            return CGSize(width: 150, height: 265)
//
//        case .categories:
//            return CGSize(width: 100, height: 100)
//
//        case .thisWeekTopStories:
//            return CGSize(width: 225, height: 225)
//
//        case .recentlyViewed:
//            return CGSize(width: 150, height: 265)
//
//        case .newAndFeatured:
//            return CGSize(width: 150, height: 265)
//
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
//
//
////MARK: - Layout
//private extension OrthogonalContainerCell {
//
//    private func setupViews() {
//        contentView.addSubview(headerStackView)
//        contentView.addSubview(actionButton)
//        contentView.addSubview(collectionView)
//
//        headerStackView.addArrangedSubview(titleLabel)
//        headerStackView.addArrangedSubview(subtitleLabel)
//
//    }
//
//    func setupConstraints() {
//        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 0)
//
//        NSLayoutConstraint.activate([
//
//            headerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            headerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
//
//            collectionView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 0),
//            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//
//            //           collectionView.heightAnchor.constraint(equalToConstant: 300),
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
//}
