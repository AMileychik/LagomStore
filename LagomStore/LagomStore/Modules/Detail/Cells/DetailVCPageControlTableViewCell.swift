//
//  DetailVCPageControlTableViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/13/24.
//

import UIKit

class DetailVCPageControlTableViewCell: UITableViewCell {
    
    var subCategories: [SubCategoryModel] = []
    
    private var currentPage: Int = 0
    private var collectionViewHeightConstraint: NSLayoutConstraint!

    private lazy var pageControlCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.registerCell(DetailVCPageControlCollectionViewCell.self)
        
        return collectionView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.currentPageIndicatorTintColor = .black
        control.pageIndicatorTintColor = .gray
        control.numberOfPages = subCategories.count
        return control
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(pageControlCollectionView)
        contentView.addSubview(pageControl)
        
        pageControlCollectionView.contentInset = .zero
//        pageControlCollectionView.layer.borderColor = UIColor.red.cgColor
//        pageControlCollectionView.layer.borderWidth = 1
    }
    
    private func setupConstraints() {
        pageControlCollectionView.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        collectionViewHeightConstraint = pageControlCollectionView.heightAnchor.constraint(equalToConstant: 0)

        NSLayoutConstraint.activate([
            
//            pageControlCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            pageControlCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            pageControlCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
  //          pageControlCollectionView.heightAnchor.constraint(equalToConstant: 515),
            
            
            
            pageControlCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            pageControlCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pageControlCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pageControlCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            pageControlCollectionView.heightAnchor.constraint(equalToConstant: 515),

            
   //         collectionViewHeightConstraint,

            
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    func update(_ model: [SubCategoryModel], collectionViewHeight: CGFloat) {
        self.subCategories = model
        pageControl.numberOfPages = model.count
        
        collectionViewHeightConstraint.constant = collectionViewHeight

        pageControlCollectionView.reloadData()
        scrollToCurrentPage()
    }
    
    func updateTest(_ model: [SubCategoryModel]) {
        self.subCategories = model
        pageControl.numberOfPages = model.count
        
        pageControlCollectionView.reloadData()
        scrollToCurrentPage()
    }
    
    
    private func scrollToCurrentPage() {
        guard currentPage < subCategories.count else { return }
        let indexPath = IndexPath(item: currentPage, section: 0)
        pageControlCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        
//        // Сбрасываем данные
//        subCategories = []
//        currentPage = 0
//        
//        // Обновляем pageControl
//        pageControl.numberOfPages = 0
//        pageControl.currentPage = 0
//        
//        // Очищаем collectionView
//        pageControlCollectionView.reloadData()
//    }
}

extension DetailVCPageControlTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeuCell(indexPath) as DetailVCPageControlCollectionViewCell
        let data = subCategories[indexPath.item]
        cell.updatePageControl(data)
        
        return cell
    }
}

extension DetailVCPageControlTableViewCell: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        currentPage = Int(scrollView.contentOffset.x / pageWidth)
        pageControl.currentPage = currentPage
    }
}

extension DetailVCPageControlTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}


