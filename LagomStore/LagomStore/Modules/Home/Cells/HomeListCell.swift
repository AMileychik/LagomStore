//
//  ListCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/8/24.
//

import UIKit

class HomeListCell: UITableViewCell {
    
    var listData: [ListModel] = []
    var rowHeights: [CGFloat] = []
    var gradienrIndexes: [Int] = []
    
    private let titleLabel = Label(type: .name)
    private let headerStackView = StackView(type: .listHeader)
    
    private var tableViewHeightConstraint: NSLayoutConstraint?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
        //       tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        return tableView
    }()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerCell(NestedCell.self)
        tableView.registerCell(VideoCell.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped() {
        print("Action button tapped!")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        listData.removeAll()
        rowHeights.removeAll()
        updateTableViewHeight(0)
    }
}

//MARK: - Public
extension HomeListCell {
    
    func update(_ model: ListHeaderModel) {
        titleLabel.text = model.labelText
        actionButton.setTitle(model.buttonTitle, for: .normal)
    }
    
    func update(_ model: [ListModel], heights: [CGFloat], gradientIndexes: [Int]) {
        listData = model
        rowHeights = heights
        updateTableViewHeight(heights.reduce(0, +))
        gradienrIndexes = gradientIndexes
        tableView.reloadData()
    }
    
    func updateTableViewHeight(_ height: CGFloat) {
        tableViewHeightConstraint?.constant = height
    }
}

//MARK: - TableDataSource
extension HomeListCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = listData[indexPath.row]
        
        if let videoURLString = data.videoURL, let videoURL = Bundle.main.url(forResource: videoURLString, withExtension: "mp4") {
            
            let cell = tableView.dequeuCell(indexPath) as VideoCell
            cell.update(videoURL, addGradient: true, isMuted: true)
            cell.playVideo()
            return cell
            
        } else {
            
            let cell = tableView.dequeuCell(indexPath) as NestedCell
            
            let shouldAddGradient = gradienrIndexes.contains(indexPath.row)
            if let imageName = data.image {
                cell.updateHomeListCell(with: ListModel(videoURL: nil, image: imageName), addGradient: shouldAddGradient)
            }
            return cell
        }
    }
}

//MARK: - TableDelegate
extension HomeListCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeights[indexPath.row]
    }
}

// MARK: - Layout
extension HomeListCell {
    
    private func setupViews() {
        contentView.addSubview(headerStackView)
        contentView.addSubview(tableView)
        
        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(actionButton)
        
//        contentView.layer.borderColor = UIColor.blue.cgColor
//        contentView.layer.borderWidth = 1
//        contentView.clipsToBounds = true
//        contentView.layer.cornerRadius = 4
    }
    
    func setupConstraints() {
        
        tableViewHeightConstraint = tableView.heightAnchor.constraint(equalToConstant: 0)
        tableViewHeightConstraint?.isActive = true
        
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            headerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            headerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            headerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            actionButton.heightAnchor.constraint(equalToConstant: 30),
            
            tableView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
