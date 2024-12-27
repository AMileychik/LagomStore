//
//  ShopListCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/27/24.
//

import UIKit

class ShopListCell: UITableViewCell {

    var listData: [ThankYouModel] = []
    var rowHeights: [CGFloat] = []
    
    private var tableViewHeightConstraint: NSLayoutConstraint?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell(NestedCell.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateTableViewHeight(_ height: CGFloat) {
        tableViewHeightConstraint?.constant = height
    }
    
    @objc private func buttonTapped() {
        print("Action button tapped!")
    }
    
//    func configure(_ model: [ThankYouModel], heights: [CGFloat]) {
//        listData = model
//        rowHeights = heights
//        tableView.reloadData()
//    }
    
    func configure(_ model: [ThankYouModel], heights: [CGFloat]) {
        listData = model
        rowHeights = heights
        updateTableViewHeight(heights.reduce(0, +))
        tableView.reloadData()
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        
//        // Сбрасываем данные
//        listData = []
//        rowHeights = []
//        
//        // Сбрасываем высоту таблицы
//        updateTableViewHeight(0)
//        
//        // Перезагружаем таблицу, чтобы удалить старые данные
//        tableView.reloadData()
//    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        listData.removeAll()
        rowHeights.removeAll()
        updateTableViewHeight(0)
    }
}

extension ShopListCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeuCell(indexPath) as NestedCell
        let data = listData[indexPath.row]
        cell.updateShopListCell(with: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeights[indexPath.row]
    }
}

// MARK: - Layout
extension ShopListCell {
    
    func setupView() {
        contentView.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableViewHeightConstraint = tableView.heightAnchor.constraint(equalToConstant: 0)
        tableViewHeightConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
