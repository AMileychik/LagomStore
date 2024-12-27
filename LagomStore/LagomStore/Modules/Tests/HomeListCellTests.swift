//
//  HomeListCellTests.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/24/24.
//

//import Foundation
//
//class HomeListCell: UITableViewCell {
//    
//    var listData: [ListModel] = []
//    var rowHeights: [CGFloat] = []
//    var gradienrIndexes: [Int] = []
//    
//    private var tableViewHeightConstraint: NSLayoutConstraint?
//    
//    private lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.isScrollEnabled = false
//        //       tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
//        tableView.separatorStyle = .none
//        tableView.allowsSelection = false
//        return tableView
//    }()
//    
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private lazy var actionButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        return button
//    }()
//    
//    private let headerStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .horizontal
//        stackView.distribution = .equalSpacing
//        stackView.alignment = .center
//        return stackView
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupViews()
//        setupConstraints()
//        
//        tableView.delegate = self
//        tableView.dataSource = self
//        
//        tableView.registerCell(NestedCell.self)
//        tableView.registerCell(VideoCell.self)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    @objc private func buttonTapped() {
//        print("Action button tapped!")
//    }
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        listData.removeAll()
//        rowHeights.removeAll()
//        updateTableViewHeight(0)
//    }
//    
//    //    override func prepareForReuse() {
//    //        super.prepareForReuse()
//    //
//    //        // Сбрасываем данные
//    //        listData = []
//    //        rowHeights = []
//    //        gradienrIndexes = []
//    //
//    //        // Очищаем текст заголовка и кнопки
//    //        titleLabel.text = nil
//    //        actionButton.setTitle(nil, for: .normal)
//    //
//    //        // Сбрасываем высоту таблицы
//    //        updateTableViewHeight(0)
//    //
//    //        // Перезагружаем таблицу, чтобы удалить старые данные
//    //        tableView.reloadData()
//    //    }
//}
//
////MARK: - Public
//extension HomeListCell {
//    
//    func update(_ model: ListHeaderModel) {
//        titleLabel.text = model.labelText
//        actionButton.setTitle(model.buttonTitle, for: .normal)
//    }
//    
//    func update(_ model: [ListModel], heights: [CGFloat], gradientIndexes: [Int]) {
//        listData = model
//        rowHeights = heights
//        updateTableViewHeight(heights.reduce(0, +))
//        gradienrIndexes = gradientIndexes
//        tableView.reloadData()
//    }
//    
//    func updateTableViewHeight(_ height: CGFloat) {
//        tableViewHeightConstraint?.constant = height
//    }
//}
//
////MARK: - TableDataSource
//extension HomeListCell: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return listData.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let data = listData[indexPath.row]
//        
//        if let videoURLString = data.videoURL, let videoURL = Bundle.main.url(forResource: videoURLString, withExtension: "mp4") {
//            
//            let cell = tableView.dequeuCell(indexPath) as VideoCell
//            cell.update(videoURL, addGradient: false)
//            cell.playVideo()
//            return cell
//            
//        } else {
//            
//            let cell = tableView.dequeuCell(indexPath) as NestedCell
//            
//            let shouldAddGradient = gradienrIndexes.contains(indexPath.row)
//            if let imageName = data.image {
//                cell.updateHomeListCell(with: ListModel(videoURL: nil, image: imageName), addGradient: shouldAddGradient)
//            }
//            return cell
//        }
//    }
//}
//
////MARK: - TableDelegate
//extension HomeListCell: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return rowHeights[indexPath.row]
//    }
//}
//
//// MARK: - Layout
//extension HomeListCell {
//    
//    private func setupViews() {
//        contentView.addSubview(headerStackView)
//        contentView.addSubview(tableView)
//        
//        headerStackView.addArrangedSubview(titleLabel)
//        headerStackView.addArrangedSubview(actionButton)
//    }
//    
//    func setupConstraints() {
//        tableViewHeightConstraint = tableView.heightAnchor.constraint(equalToConstant: 0)
//        tableViewHeightConstraint?.isActive = true
//        
//        NSLayoutConstraint.activate([
//            headerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            headerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            headerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            
//            actionButton.heightAnchor.constraint(equalToConstant: 30),
//            
//            tableView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 8),
//            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//        ])
//    }
//}



//Реализация HomeList cell без вложенной таблицы.
//
//Для вашего сценария, где нужно отказаться от вложенных таблиц и коллекций, можно реализовать логику с добавлением строк VideoCell и NestedCell непосредственно в основной HomeTableView. В этом случае каждую строку в секции list можно будет представить отдельной моделью, которую основной HomeTableView будет отображать. Вот как это можно реализовать:
//
//Обновление HomeSections
//
//Добавим возможность использовать массив строк в list-секции:
//
//extension HomeTableView {
//    enum HomeSections {
//        case welcome(String)
//        case topPicks([TopPickModel], header: UniversalHeaderModel)
//        case pageControl([PageControlModel])
//        case list(rows: [ListRow])
//        case productCategory1([TopPickModel], header: UniversalHeaderModel)
//        case alwaysPopular([AlwaysPopularModel])
//        case productCategory2([PageControlModel], header: UniversalHeaderModel)
//        case thankYou([ThankYouModel])
//    }
//
//    enum ListRow {
//        case video(VideoModel)
//        case nested(NestedModel)
//    }
//}
//
//Обновление DataSource
//
//Обновим cellForRowAt, чтобы обработать строки внутри list-секции:
//
//func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    let sectionData = homeSections[section]
//    switch sectionData {
//    case .list(let rows):
//        return rows.count
//    default:
//        return 1
//    }
//}
//
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let sectionData = homeSections[indexPath.section]
//    
//    switch sectionData {
//    case .welcome(let text):
//        let cell = tableView.dequeuCell(indexPath) as WelcomeCell
//        cell.update(text)
//        return cell
//
//    case .topPicks(let model, let header):
//        let cell = tableView.dequeuCell(indexPath) as OrthogonalContainerCell
//        let sectionHeight: CGFloat = 300
//        cell.update(dataType: .thisWeekTopStories(model), height: sectionHeight)
//        cell.update(header)
//        cell.delegate = self
//        return cell
//
//    case .pageControl(let model):
//        let cell = tableView.dequeuCell(indexPath) as PageControlCell
//        let sectionHeight: CGFloat = 150
//        cell.update(model, height: sectionHeight)
//        cell.isAutoScrollingEnabled = false
//        return cell
//
//    case .list(let rows):
//        let rowData = rows[indexPath.row]
//        switch rowData {
//        case .video(let videoModel):
//            let cell = tableView.dequeuCell(indexPath) as VideoCell
//            cell.update(videoModel)
//            return cell
//        case .nested(let nestedModel):
//            let cell = tableView.dequeuCell(indexPath) as NestedCell
//            cell.update(nestedModel)
//            return cell
//        }
//
//    case .productCategory1(let model, let header):
//        let cell = tableView.dequeuCell(indexPath) as OrthogonalContainerCell
//        let sectionHeight: CGFloat = 400
//        cell.update(dataType: .topPicks(model), height: sectionHeight)
//        cell.update(header)
//        cell.delegate = self
//        return cell
//
//    case .alwaysPopular(let model):
//        let cell = tableView.dequeuCell(indexPath) as AlwaysPopularCell
//        let model = model[indexPath.item]
//        cell.update(model)
//        return cell
//
//    case .productCategory2(let model, let header):
//        let cell = tableView.dequeuCell(indexPath) as OrthogonalContainerCell
//        let sectionHeight: CGFloat = 250
//        cell.update(dataType: .productCategory2(model), height: sectionHeight)
//        cell.update(header)
//        cell.delegate = self
//        return cell
//
//    case .thankYou(let model):
//        let cell = tableView.dequeuCell(indexPath) as ThankYouCell
//        let model = model[indexPath.item]
//        cell.update(model)
//        return cell
//    }
//}
//
//Пример данных
//
//Теперь list-секция может содержать разные строки:
//
//homeSections = [
//    .welcome("Добро пожаловать"),
//    .list(rows: [
//        .video(VideoModel(videoURL: URL(string: "https://example.com/video.mp4")!, title: "Видео 1")),
//        .nested(NestedModel(title: "Популярные товары", items: ["Товар 1", "Товар 2", "Товар 3"]))
//    ]),
//    .thankYou([ThankYouModel(message: "Спасибо за ваш выбор!")])
//]
//
//Видео-ячейка (VideoCell)
//
//final class VideoCell: UITableViewCell {
//    func update(_ model: VideoModel) {
//        // Настройка видео-ячейки
//    }
//}
//
//Вложенная строка (NestedCell)
//
//final class NestedCell: UITableViewCell {
//    func update(_ model: NestedModel) {
//        // Настройка вложенной строки
//    }
//}
//
//Теперь каждая строка в list-секции отображается в своей ячейке в основной таблице.

//
//{
//  "homeSections": [
//    {
//      "sectionType": "list",
//      "rows": [
//        {
//          "type": "nested",
//          "title": "Популярные товары",
//          "items": [
//            { "image": "image1_url", "name": "Товар 1" },
//            { "image": "image2_url", "name": "Товар 2" }
//          ]
//        },
//        {
//          "type": "video",
//          "videoURL": "https://example.com/video1.mp4",
//          "title": "Видео 1"
//        },
//        {
//          "type": "nested",
//          "title": "Другие товары",
//          "items": [
//            { "image": "image3_url", "name": "Товар 3" },
//            { "image": "image4_url", "name": "Товар 4" }
//          ]
//        }
//      ]
//    }
//  ]
//}
//
//// Модель для отдельного товара в NestedCell
//struct Product {
//    let image: String
//    let name: String
//}
//
//// Модель для NestedCell
//struct NestedModel {
//    let title: String
//    let items: [Product] // Список товаров
//}
//
//// Модель для VideoCell
//struct VideoModel {
//    let videoURL: URL
//    let title: String
//}
//
//// Модель для секции с несколькими строками
//struct HomeSection {
//    let sectionType: String
//    let rows: [ListRow]
//}
//
//// Модель для строки с видео или вложенной ячейкой
//enum ListRow {
//    case video(VideoModel)
//    case nested(NestedModel)
//}
//
//
//import Foundation
//
//// JSON-строка
//let jsonString = """
//{
//  "homeSections": [
//    {
//      "sectionType": "list",
//      "rows": [
//        {
//          "type": "nested",
//          "title": "Популярные товары",
//          "items": [
//            { "image": "image1_url", "name": "Товар 1" },
//            { "image": "image2_url", "name": "Товар 2" }
//          ]
//        },
//        {
//          "type": "video",
//          "videoURL": "https://example.com/video1.mp4",
//          "title": "Видео 1"
//        },
//        {
//          "type": "nested",
//          "title": "Другие товары",
//          "items": [
//            { "image": "image3_url", "name": "Товар 3" },
//            { "image": "image4_url", "name": "Товар 4" }
//          ]
//        }
//      ]
//    }
//  ]
//}
//"""
//
//// Парсинг данных
//struct HomeData: Codable {
//    let homeSections: [HomeSection]
//}
//
//let decoder = JSONDecoder()
//if let jsonData = jsonString.data(using: .utf8) {
//    do {
//        let homeData = try decoder.decode(HomeData.self, from: jsonData)
//        print(homeData) // Печать распарсенных данных
//    } catch {
//        print("Ошибка при парсинге JSON: \(error)")
//    }
//}
//
//func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    let sectionData = homeSections[section]
//    switch sectionData {
//    case .list(let rows):
//        return rows.count
//    default:
//        return 1
//    }
//}
//
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let sectionData = homeSections[indexPath.section]
//    
//    switch sectionData {
//    case .list(let rows):
//        let rowData = rows[indexPath.row]
//        switch rowData {
//        case .video(let videoModel):
//            let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
//            cell.update(videoModel)
//            return cell
//        case .nested(let nestedModel):
//            let cell = tableView.dequeueReusableCell(withIdentifier: "NestedCell", for: indexPath) as! NestedCell
//            cell.update(nestedModel)
//            return cell
//        }
//    default:
//        return UITableViewCell()
//    }
//}
//
//final class NestedCell: UITableViewCell {
//    func update(_ model: NestedModel) {
//        // Настройка заголовка
//        titleLabel.text = model.title
//        
//        // Настройка товаров
//        for (index, product) in model.items.enumerated() {
//            // Загрузить картинку по URL (например, с использованием UIImageView)
//            // Пример: imageView.setImage(from: product.image)
//            // Настроить название товара (например, в UILabel)
//            // Пример: nameLabel.text = product.name
//        }
//    }
//}
