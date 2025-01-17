//
//  DetailTableView.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/28/24.
//

import UIKit

class DetailTableView: UITableView {
    
    var ordersService: OrdersServiceProtocol = OrdersService()
    private var expandedIndexPaths: Set<IndexPath> = []
    
    var dataModels: [DetailSections] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        delegate = self
        dataSource = self
        separatorStyle = .none
        allowsSelection = false
        
        registerCell(DetailVCPageControlTableViewCell.self)
        registerCell(CategoriesTableViewCell.self)
        registerCell(DetailButtons.self)
        registerCell(PageControlCell.self)
        registerCell(ExpandableCell.self)
        registerCell(OrthogonalContainerCell.self)
        registerCell(NearbyStoresCell.self)
        registerCell(ProductDescription.self)
    }
    
    func updateFirstSection(with topPicks: [SubCategoryModel], category: String) {
        if !topPicks.isEmpty {
            dataModels[0] = .pageControl(topPicks)
            reloadData()
        } else {
            print("No categories: \(category)")
        }
    }
    
    // Метод обработки развертывания
    func handleExpand(for indexPath: IndexPath) {
        if expandedIndexPaths.contains(indexPath) {
            expandedIndexPaths.remove(indexPath)
        } else {
            expandedIndexPaths.insert(indexPath)
        }
        reloadRows(at: [indexPath], with: .automatic)
    }
}

// MARK: - TableViewDataSource
extension DetailTableView: UITableViewDataSource {
    
    enum DetailSections {
        case pageControl([SubCategoryModel])
        case productOptions([TopPickModel])
        case detailButtons(DetailButtonsModel, model: TopPickModel)
        case pageControlwithDuration([PageControlModel])
        case productDescription
        case expandableSection
        case youMightAlsoLike([ThankYouModel])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = dataModels[section]
        switch sections {
        case .expandableSection:
            return 2 // Две строки в новой секции
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let detailSectionsData = dataModels[indexPath.section]
        switch detailSectionsData {
            
        case .pageControl(let model):
            let cell = tableView.dequeuCell(indexPath) as DetailVCPageControlTableViewCell
            cell.updateTest(model)
            return cell
            
        case .productOptions(let models):
            let cell = tableView.dequeuCell(indexPath) as CategoriesTableViewCell
            cell.delegate = self
            let shoesCategory = models.compactMap { $0.categories }.flatMap {$0}
            cell.updateCategories(shoesCategory)
            return cell
            
        case .detailButtons(let model, model: let model2):
            let cell = tableView.dequeuCell(indexPath) as DetailButtons
            cell.update(model, topPickModel: model2)
            
            cell.onFavoriteButton = {
                self.ordersService.saveAndAdd([model2])
                self.ordersService.printtopPickStorage()
            }
            return cell
            
        case .pageControlwithDuration(let model):
            let cell = tableView.dequeuCell(indexPath) as PageControlCell
            cell.update(model, sectionHeight: 150)
            cell.isAutoScrollingEnabled = true
            return cell
            
        case .productDescription:
            let cell = tableView.dequeuCell(indexPath) as ProductDescription
            cell.update(withText: "The Nike Air Jordan sneakers combine iconic style with modern performance, making them a favorite both on and off the court. Known for their premium materials, the Jordans feature a mix of leather and synthetic uppers for durability and a sleek look. The cushioned midsole and Nike Air technology provide exceptional comfort and support for all-day wear. With their bold design and classic Jumpman logo, these sneakers are a statement piece in any wardrobe. The Air Jordan model is a perfect blend of heritage, innovation, and streetwear culture",
                           buttonTitle: "View Product Details")
            return cell
            
        case .expandableSection:
            let cell = tableView.dequeuCell(indexPath) as ExpandableCell
            let isExpanded = expandedIndexPaths.contains(indexPath)
            
            if indexPath.row == 0 {
                cell.update(with: "Контент для первой строки", buttonTitle: "Кнопка 1", isExpanded: isExpanded)
            } else {
                cell.update(with: "Лейбл 1 для второй строки", buttonTitle: "Кнопка 2", additionalLabel: "Лейбл 2 для второй строки", isExpanded: isExpanded)
            }
            
            cell.expandButtonTapped = { [weak self] in
                self?.handleExpand(for: indexPath)
            }
            return cell
            
        case .youMightAlsoLike(let model):
            let cell = tableView.dequeuCell(indexPath) as NearbyStoresCell
            cell.update(.nearbyStoreSectionData(models: model), sectionHeight: 300)
//            cell.configureHeader(with: header)
            return cell
        }
    }
}

// MARK: - TableViewDelegate
extension DetailTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if expandedIndexPaths.contains(indexPath) {
            // Увеличенная высота для развернутой ячейки
            return 100
        }
        
        let sections = dataModels[indexPath.section]
        switch sections {
        case .pageControl:
            return 515
        case .productOptions:
            return 125
        case .detailButtons:
            return 150
        case .pageControlwithDuration:
            return 150
        case .productDescription:
            return 350
        case .expandableSection:
            return 50
        case .youMightAlsoLike:
            return 275
        }
    }
}

extension DetailTableView: TableViewCellDelegate {
    func didSelectItem(with model: [SubCategoryModel], subCategory: String) {
        updateFirstSection(with: model, category: subCategory)
        print("\(subCategory)")
    }
}
