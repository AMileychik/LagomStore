//
//  FavoriteVCTableViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/13/24.
//

import UIKit

class FavoriteVCTableViewCell: UITableViewCell {
    
    private var data: [TopPickModel] = []
    var orderService: OrdersServiceProtocol = OrdersService()
    
//    var onEditModeChange: (() -> Void)?
    
    private var isEditingMode: Bool = false

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.registerCell(FavoriteCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false // Высота зависит от контента
 //       collectionView.backgroundColor = .orange
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
//    func update(_ model: [TopPickModel], isEditing: Bool = false) {
//        self.data = model
////                collectionView.reloadData()
//        self.isEditingMode = isEditing
//        updateCollectionViewHeight() // Обновляем высоту CollectionView
//        collectionView.reloadData()
//    }
    
    func update(_ model: [TopPickModel], isEditing: Bool = false) {
        self.data = model
        self.isEditingMode = isEditing
        
       
        updateCollectionViewHeight() // Обновляем высоту CollectionView
        //collectionView.layoutIfNeeded()
        
        collectionView.reloadData()
    }
    
//    func reloadCollectionViewData() {
//        collectionView.reloadData()
//    }
    
    private func setupView() {
        contentView.addSubview(collectionView)
 
// Maybe this code is important??? Do not delete
//        collectionView.invalidateIntrinsicContentSize()
//        collectionView.layoutIfNeeded()
///
        
        
//        var heightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 400)
//        heightConstraint.priority = .defaultHigh
//        heightConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    

    
    
    var heightConstraint: NSLayoutConstraint?
    
//    func updateCollectionViewHeight() {
//        let rows = ceil(Double(data.count) / 2.0) // Количество строк (по 2 ячейки в строке)
//        let itemHeight = (UIScreen.main.bounds.width - (3 * 8)) / 2 // Ширина одной ячейки (с учётом отступов)
//        let totalHeight = rows * Double(itemHeight) + (rows - 1) * 8 + 16 // Высота контента
//        collectionView.heightAnchor.constraint(equalToConstant: totalHeight).isActive = true
//
//        
//        
////        heightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 0)
////        heightConstraint?.isActive = true
////        
////        heightConstraint?.constant = 250 * rows
////        
////        collectionView.layoutIfNeeded()
////        
////        collectionView.reloadData()
////        
////        print(heightConstraint?.constant)
//        
//        
//        
//        
//        
//        //rows
//        //collectionView.heightAnchor.constraint(equalToConstant: 250 * rows).isActive = true
//        
//        //collectionView.layoutIfNeeded()
//        
//        //collectionView.heightAnchor.constraint(equalToConstant: 250 * rows).isActive = true
//    }
    
    
    
    
    
    
    
    
/////////

    func updateCollectionViewHeight() {
//        layoutIfNeeded() // Для обновления текущего размера
        
        let rows = ceil(Double(data.count) / 2.0) // Количество строк
        let itemHeight = (UIScreen.main.bounds.width - (3 * 8)) / 2
        let totalHeight = rows * Double(itemHeight) + (rows - 1) * 8 + 16

        if let heightConstraint = collectionView.constraints.first(where: { $0.firstAttribute == .height }) {
            heightConstraint.constant = totalHeight
        } else {
            let heightConstraint = collectionView.heightAnchor.constraint(equalToConstant: totalHeight)
            heightConstraint.priority = .defaultHigh
            heightConstraint.isActive = true
        }
        
//        layoutIfNeeded() // Применяем новые изменения
        

//        contentView.layoutIfNeeded()
    }
    
    
    
    
    
    
    
    
    
//    func updateCollectionViewHeight() {
////        layoutIfNeeded() // Для обновления текущего размера
//        
//        let rows = ceil(Double(data.count) / 2.0) // Количество строк
//        let itemHeight = (UIScreen.main.bounds.width - (3 * 8)) / 2
//        let totalHeight = rows * Double(itemHeight) + (rows - 1) * 8 + 16
//
//        if let heightConstraint = collectionView.constraints.first(where: { $0.firstAttribute == .height }) {
//            heightConstraint.constant = totalHeight
//        } else {
//            let heightConstraint = collectionView.heightAnchor.constraint(equalToConstant: totalHeight)
//            heightConstraint.isActive = true
//        }
//        
// //       layoutIfNeeded() // Применяем новые изменения
//    }
    

//    func updateCollectionViewHeight() {
//       // collectionView.layoutIfNeeded()
//
//        // Удалите старый констрейнт
//        if let heightConstraint = heightConstraint {
//            heightConstraint.isActive = false
//            collectionView.removeConstraint(heightConstraint)
//        }
//
//        // Рассчитайте новую высоту
//        let rows = ceil(Double(data.count) / 2.0)
//        let itemHeight = (UIScreen.main.bounds.width - (3 * 8)) / 2
//        let totalHeight = rows * Double(itemHeight) + (rows - 1) * 8 + 16
//
//        // Примените новый констрейнт
//        heightConstraint = collectionView.heightAnchor.constraint(equalToConstant: totalHeight)
//        heightConstraint?.isActive = true
//
//        // Обновите layout ячейки
// //       contentView.layoutIfNeeded()
//    }
}

extension FavoriteVCTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeuCell(indexPath) as FavoriteCollectionViewCell
        let model = data[indexPath.item]
    
        cell.update(model, isEdining: isEditingMode)    
        
        cell.onDelete = {
            let updatedData = self.orderService.delete(model)
            self.data = updatedData
  //          self.collectionView.reloadData()
        }
        return cell
    }
}

extension FavoriteVCTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let totalSpacing = (3 * 8) // Отступы: 2 ячейки и края секции
        let width = (Int(collectionView.bounds.width) - totalSpacing) / 2 // Ширина ячейки
        return CGSize(width: width, height: width) // Высота = ширина для квадратной ячейки
    }
}



















//class FavoriteCollectionViewCell: UICollectionViewCell {
//
//    static let identifier = "FavoriteCollectionViewCell"
//
//    private let label: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        label.numberOfLines = 1
//        return label
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func configure(with model: TopPickModel) {
//        label.text = model.description
//    }
//
//    private func setupView() {
//        contentView.addSubview(label)
//
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
//        ])
//
//        contentView.layer.cornerRadius = 8
//        contentView.layer.borderWidth = 1
//        contentView.layer.borderColor = UIColor.lightGray.cgColor
//    }
//}











//class FavoriteVCTableViewCell: UITableViewCell {
//    
//    static let identifier = "FavoriteVCTableViewCell"
//    
//    private lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//    
//        layout.itemSize = CGSize(width: 150, height: 150) // Размер ячейки
//        layout.minimumInteritemSpacing = 8
//        layout.minimumLineSpacing = 8
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: FavoriteCollectionViewCell.identifier)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.isScrollEnabled = false
//        return collectionView
//    }()
//    
//    private var data: [TopPickModel] = [] // Пример данных
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupView()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func configure(with model: [TopPickModel]) {
//        self.data = model
//        print("Configuring cell with data count: \(data.count)")
//        collectionView.reloadData()
//    }
//    
//    private func setupView() {
//        contentView.addSubview(collectionView)
//        
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
//    }
//}
//
//extension FavoriteVCTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
//  
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return data.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//      
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCollectionViewCell.identifier, for: indexPath) as? FavoriteCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//        let data = data[indexPath.item]
//        cell.configure(with: data)
//        return cell
//    }
//}
//
//class FavoriteCollectionViewCell: UICollectionViewCell {
//    
//    static let identifier = "FavoriteCollectionViewCell"
//    
//    private let label: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        label.numberOfLines = 1
//        return label
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func configure(with model: TopPickModel) {
//        label.text = model.description
//    }
//    
//    private func setupView() {
//        contentView.addSubview(label)
//        
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
//        ])
//        
//        contentView.layer.cornerRadius = 8
//        contentView.layer.borderWidth = 1
//        contentView.layer.borderColor = UIColor.lightGray.cgColor
//    }
//}































//class FavoriteVCTableViewCell: UITableViewCell {
//    
//    private var firstLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private var secondLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupView()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func updateWith(_ topPickModel: [TopPickModel]) {
//        // Проверка, чтобы обновить только существующие данные
//        if topPickModel.count > 0 {
//            firstLabel.text = topPickModel.first?.type // или другое свойство
//        }
//        
//        if topPickModel.count > 1 {
//            secondLabel.text = topPickModel.first?.price // или другое свойство
//        }
//    }
//    
//    func update(model: [Product]) {
//        firstLabel.text = model.first?.name
//    }
//    
//    private func setupView() {
//        contentView.addSubview(firstLabel)
//        contentView.addSubview(secondLabel)
//
//        
//        NSLayoutConstraint.activate([
//            // Констрейнты для первого лейбла
//            firstLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            firstLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            firstLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            
//            // Констрейнты для второго лейбла
//            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 8),
//            secondLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            secondLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            secondLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
//        ])
//    }
//}



















//class FavoriteVCTableViewCell: UITableViewCell {
//    
//    private var label: UILabel = UILabel()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupView()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
//    }
//    
////    func update(_ products: [Product]) {
////        // Обновление данных в ячейке
////        label.text = products.map { $0.name }.joined(separator: ", ")
////    }
//    
//    func update(_ products: [TopPickModel]) {
//        // Обновление данных в ячейке
////        label.text = products.map { $0.price }.joined(separator: ", ")
//        label.text = products.first?.price
//    }
//    
//    private func setupView() {
//        contentView.addSubview(label)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
//        ])
//    }
//}



















//
//class FavoriteVCTableViewCell: UITableViewCell {
//    
//    private var favoriteData: [Product] = []
//    
//    private lazy var favoritesTopStoriesCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.isScrollEnabled = false
//        collectionView.showsHorizontalScrollIndicator = false
//        
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        
//        collectionView.registerCell(TopPicksCollectionViewCell.self)
//        collectionView.registerCell(FavoriteVCCollectionViewCell.self)
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
//}
//
////MARK: - Public
//extension FavoriteVCTableViewCell {
//    func update(_ model: [Product]) {
//        self.favoriteData = model
//        favoritesTopStoriesCollectionView.reloadData()
//    }
//}
//
////MARK: - Layout
//extension FavoriteVCTableViewCell {
//    
//    func setupViews() {
//        selectionStyle = .none
//        //       backgroundColor = .systemBackground
//        contentView.addSubview(favoritesTopStoriesCollectionView)
//    }
//    
//    func setupConstraints() {
//        favoritesTopStoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            
//            favoritesTopStoriesCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            favoritesTopStoriesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            favoritesTopStoriesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            favoritesTopStoriesCollectionView.heightAnchor.constraint(equalToConstant: 350),
//        ])
//    }
//}
//
//extension FavoriteVCTableViewCell: UICollectionViewDelegate {}
//
//extension FavoriteVCTableViewCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return favoriteData.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeuCell(indexPath) as FavoriteVCCollectionViewCell
//        let data = favoriteData[indexPath.item]
//        cell.updateThisWeekTopStories(data)
//        
//        return cell
//    }
//}
//
//extension FavoriteVCTableViewCell: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 150, height: 250)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 16
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 16
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
//    }
//}






