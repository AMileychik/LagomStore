//
//  PageControlCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/7/24.
//

import UIKit

class PageControlCell: UITableViewCell {
    
    var pageControlData: [PageControlModel] = []
    private var indicatorsViews: [UIView] = []
    private var autoScrollTimer: Timer?
    var isAutoScrollingEnabled: Bool = true
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.registerCell(PageControlCollectionViewCell.self)
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        setupIndicators()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createIndicatorView(width: CGFloat, height: CGFloat, isFirst: Bool) -> UIView {
        let indicator = UIView()
        indicator.backgroundColor = .gray
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        let blackPart = UIView()
        blackPart.backgroundColor = .clear // Начальный цвет черной части
        blackPart.translatesAutoresizingMaskIntoConstraints = false
        blackPart.frame = CGRect(x: 0, y: 0, width: 0, height: height) // Начальный размер черной части
        
        indicator.addSubview(blackPart)
        
        return indicator
    }
    
    private func setupIndicators() {
        let numbersOfIndicators = pageControlData.count
        let indicatorHeight: CGFloat = 2
        let indicatorWidth: CGFloat = 15
        let spacing: CGFloat = 4
        
        // Очистка предыдущих индикаторов
        indicatorsViews.forEach { $0.removeFromSuperview() }
        indicatorsViews.removeAll()
        
        for index in 0..<numbersOfIndicators {
            let indicator = createIndicatorView(width: indicatorWidth, height: indicatorHeight, isFirst: index == 0)
            contentView.addSubview(indicator)
            indicatorsViews.append(indicator)
            
            let xOffset = CGFloat(index) * (spacing + indicatorWidth) - (CGFloat(numbersOfIndicators) * (spacing + indicatorWidth) - spacing) / 2
            
            NSLayoutConstraint.activate([
                indicator.widthAnchor.constraint(equalToConstant: indicatorWidth),
                indicator.heightAnchor.constraint(equalToConstant: indicatorHeight),
                indicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: xOffset),
                indicator.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -8)
            ])
        }
        
        // Установка черного цвета для первого индикатора при загрузке
        if let firstIndicator = indicatorsViews.first {
            let blackPart = firstIndicator.subviews[0]
            blackPart.backgroundColor = .black
            blackPart.frame.size.width = indicatorWidth
        }
    }
    
    private func updateIndicatorProgress(scrollOffset: CGFloat) {
        let pageWidth = collectionView.frame.width
        let fractionalPage = scrollOffset / pageWidth
        
        for (index, indicator) in indicatorsViews.enumerated() {
            let blackPart = indicator.subviews[0]
            let indicatorWidth = indicator.frame.width
            
            if index == Int(fractionalPage) {
                // Если текущая страница равна индексу индикатора
                let progress = fractionalPage - CGFloat(index)
                blackPart.frame.size.width = indicatorWidth * (1 - progress)
                blackPart.frame.origin.x = indicatorWidth * progress
                blackPart.backgroundColor = .black // Устанавливаем черный цвет для текущего индикатора
            } else if index == Int(fractionalPage) + 1 {
                // Для следующего индикатора
                blackPart.frame.size.width = indicatorWidth * (fractionalPage - CGFloat(index) + 1)
                blackPart.frame.origin.x = 0
                blackPart.backgroundColor = .black // Устанавливаем черный цвет для следующего индикатора
            } else {
                // Для остальных индикаторов
                blackPart.frame.size.width = 0
                blackPart.backgroundColor = .clear // Прозрачный цвет для остальных индикаторов
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if autoScrollTimer == nil && !pageControlData.isEmpty {
            startAutoScrollTimer() // Запуск таймера только после вычисления размеров
        }
    }
    
    func startAutoScrollTimer() {
        guard autoScrollTimer == nil, isAutoScrollingEnabled else { return } // Избегаем дублирования таймеров и проверяем флаг
        autoScrollTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(scrollToNextPage), userInfo: nil, repeats: true)
    }
    
    @objc private func scrollToNextPage() {
        let currentOffset = collectionView.contentOffset.x
        let pageWidth = collectionView.frame.width
        let nextOffset = currentOffset + pageWidth
        let maxOffset = collectionView.contentSize.width - pageWidth
        
        if nextOffset <= maxOffset {
            collectionView.setContentOffset(CGPoint(x: nextOffset, y: 0), animated: true)
        } else {
            collectionView.setContentOffset(.zero, animated: true) // Возвращаемся к первой странице
        }
    }
    
    func stopAutoScrollTimer() {
        autoScrollTimer?.invalidate()
        autoScrollTimer = nil
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // Остановка таймера
        stopAutoScrollTimer()

        // Сброс данных
        pageControlData = []
        
        // Очистка collectionView
        collectionView.setContentOffset(.zero, animated: false)
        collectionView.reloadData()
        
        // Удаление индикаторов
        indicatorsViews.forEach { $0.removeFromSuperview() }
        indicatorsViews.removeAll()
    }
}


//MARK: - Public
extension PageControlCell {
    
    func update(_ model: [PageControlModel], sectionHeight: CGFloat) {
        self.pageControlData = model
        setupIndicators()
        if let heightConstraint = collectionView.constraints.first(where: { $0.firstAttribute == .height }) {
            heightConstraint.constant = sectionHeight
            heightConstraint.priority = .defaultHigh
        }
        collectionView.reloadData()
    }
}

// MARK: - CollectionViewDataSource
extension PageControlCell: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageControlData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeuCell(indexPath) as PageControlCollectionViewCell
        let data = pageControlData[indexPath.item]
        cell.updatePageControl(data)
        return cell
    }
}

// MARK: - ScrollViewDelegate
extension PageControlCell: UIScrollViewDelegate {
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateIndicatorProgress(scrollOffset: scrollView.contentOffset.x)
    }
}

// MARK: - CollectionViewDelegateFlowLayout
extension PageControlCell: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        //        let width = collectionView.frame.width - 32
        return CGSize(width: width, height: collectionView.frame.height)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 16
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        stopAutoScrollTimer() // Остановка авто-прокрутки при начале перетаскивания
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        startAutoScrollTimer() // Перезапуск авто-прокрутки после остановки
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let pageControlCell = cell as? PageControlCell {
            pageControlCell.startAutoScrollTimer() // Перезапуск таймера
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let pageControlCell = cell as? PageControlCell {
            pageControlCell.stopAutoScrollTimer() // Остановка таймера
        }
    }
}

// MARK: - Layout
private extension PageControlCell {
    
    func setupViews() {
        contentView.addSubview(collectionView)
        
//        contentView.layer.borderColor = UIColor.blue.cgColor
//        contentView.layer.borderWidth = 1
//        contentView.clipsToBounds = true
//        contentView.layer.cornerRadius = 4
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 0),
        ])
    }
}

