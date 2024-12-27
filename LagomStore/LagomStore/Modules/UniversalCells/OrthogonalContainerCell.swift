//
//  MainTableViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 9/30/24.
//

import UIKit

protocol OrthogonalContainerCellDelegate: AnyObject {
    func didSelectItem(with model: [TopPickModel], category: String)
    func didSelectItem2(with model: [PageControlModel])
}

enum CellDataType {
    case topPicks(_ model: [TopPickModel])
    case thisWeekTopStories(_ model: [TopPickModel])
    case productCategory2(_ model: [PageControlModel])
    
    var itemSize: CGSize {
        switch self {
        case .topPicks:
            return CGSize(width: 150, height: 285)
        case .thisWeekTopStories:
            return CGSize(width: 225, height: 235)
        case .productCategory2:
            return CGSize(width: 225, height: 225)
        }
    }
}

class OrthogonalContainerCell: UITableViewCell {
    
    weak var delegate: OrthogonalContainerCellDelegate?
    private var dataType: CellDataType?
    var onRemoveSection: (() -> Void)?
    
    private lazy var titleLabel = Label(type: .name)
    private lazy var subtitleLabel = Label(type: .description)
    private let headerStackView = StackView(type: .headerStackView)
    
    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.registerCell(TestCollectionViewCell.self)
        collectionView.registerCell(CategoriesCollectionViewCell.self)
        collectionView.registerCell(UniversalCollectionViewCell.self)
        collectionView.registerCell(NearbyStoresCollectionViewCell.self)
        collectionView.registerCell(PageControlCollectionViewCell.self)
        collectionView.registerCell(NewAndFeaturedCellCollectionViewCell.self)
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped() {
        onRemoveSection?()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subtitleLabel.text = nil
        actionButton.setTitle(nil, for: .normal)
        dataType = nil
        collectionView.reloadData()
    }
}

//MARK: - Public
extension OrthogonalContainerCell {
    func update(dataType: CellDataType, height: CGFloat) {
        self.dataType = dataType
        if let heightConstraint = collectionView.constraints.first(where: { $0.firstAttribute == .height }) {
            heightConstraint.constant = height
            heightConstraint.priority = .defaultHigh
        }
        collectionView.reloadData()
    }
    
    func update(_ model: UniversalHeaderModel?) {
        titleLabel.text = model?.firstLabelText
        subtitleLabel.text = model?.subtitleLabel
        actionButton.setTitle(model?.buttonTitle, for: .normal)
    }
    
    func updateHeader(_ model: TitleHeaderModel?) {
        titleLabel.text = model?.title
        subtitleLabel.text = model?.subtitleLabel
        actionButton.setTitle(model?.buttonTitle, for: .normal)
    }
}

// MARK: - UICollectionViewDataSource
extension OrthogonalContainerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let dataType = dataType else { return 0 }
        switch dataType {
            
        case .topPicks(let models):
            return models.count
            
        case .thisWeekTopStories(let models):
            return models.count
            
        case .productCategory2(models: let models):
            return models.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let dataType = dataType else { return UICollectionViewCell() }
        switch dataType {
            
        case .topPicks(let models):
            let cell = collectionView.dequeuCell(indexPath) as UniversalCollectionViewCell
            let data = models[indexPath.item]
            cell.update(section: .topPicks(models: [data]))
            return cell
            
        case .thisWeekTopStories(let models):
            let cell = collectionView.dequeuCell(indexPath) as NewAndFeaturedCellCollectionViewCell
            let data = models[indexPath.item]
            cell.updateNewAndFeaturedSection(data)
            return cell
            
        case .productCategory2(models: let models):
            let cell = collectionView.dequeuCell(indexPath) as PageControlCollectionViewCell
            let data = models[indexPath.item]
            cell.updatePageControl(data)
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate
extension OrthogonalContainerCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let dataType = dataType else { return }
        switch dataType {
            
        case .topPicks(let models):
            let model = models[indexPath.item]
            let category = model.categoryName ?? ""
            delegate?.didSelectItem(with: [model], category: category)
            
        case .thisWeekTopStories(let models):
            let model = models[indexPath.item]
            let category = model.categoryName ?? ""
            delegate?.didSelectItem(with: [model], category: category)
            
        case .productCategory2(models: let models):
            let model = models[indexPath.item]
            delegate?.didSelectItem2(with: [model])
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension OrthogonalContainerCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return dataType?.itemSize ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 24, bottom: 0, right: 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}

// MARK: - Layout
private extension OrthogonalContainerCell {
    
    func setupViews() {
        contentView.addSubview(headerStackView)
        contentView.addSubview(actionButton)
        contentView.addSubview(collectionView)
        
        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(subtitleLabel)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            headerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            collectionView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            collectionView.heightAnchor.constraint(equalToConstant: 0),
            
            actionButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            actionButton.widthAnchor.constraint(equalToConstant: 75),
            actionButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}




