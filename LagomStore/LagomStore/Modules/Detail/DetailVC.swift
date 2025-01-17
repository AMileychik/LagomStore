//
//  DetailVC.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/28/24.
//

import UIKit

class DetailVC: UIViewController {
    
    var tableView = DetailTableView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

// MARK: - Business Logic
extension DetailVC {
    func updateWithCategory(_ topPicksModel: [TopPickModel], category: String) {
        
        guard let subCategories = topPicksModel.first?.categories?.first?.subCategories else { return }
        let categories = topPicksModel.filter { $0.categoryName == category }
        guard let buttonsTitles = topPicksModel.first?.detailButtonsName else { return }
        guard let pageControlData = topPicksModel.first?.pagecontrolModel else { return }
        guard let youMightAlsoLikeData = topPicksModel.first?.youMightAlsoLike else { return }
        let topPickModels = topPicksModel.filter { $0.id != 0 }
        let firstTopPickModel = topPickModels.first
        
//        guard let listCellData = topPicksModel.first?.listCategories else { return }
        
        tableView.dataModels = [
            .pageControl(subCategories),
            .productOptions(categories),
            .detailButtons(buttonsTitles, model: firstTopPickModel!),
            .pageControlwithDuration(pageControlData),
            .productDescription,
            .expandableSection,
            .youMightAlsoLike(youMightAlsoLikeData)
        ]
        tableView.reloadData()
    }
    
    func updateWithCategory2(_ pageControlModel: [PageControlModel]) {
      
        let data = pageControlModel

        tableView.dataModels = [
 //           .pageControl(subCategories),
//            .productOptions(categories),
//            .detailButtons(buttonsTitles),
//            .expandableSection,
            .pageControlwithDuration(data),
//            .listSection(data)
//            .thankYou(data)
        ]
        tableView.reloadData()
    }
}

// MARK: - Layout
extension DetailVC {
    
    func setupViews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
