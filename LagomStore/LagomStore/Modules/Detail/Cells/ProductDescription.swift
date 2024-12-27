//
//  ProductDescription.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/14/24.
//

import UIKit

class ProductDescription: UITableViewCell {
    
    // MARK: - UI элементы
    private let customLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Пример текста"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private let customButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Установка атрибутированного текста с подчеркиванием
        let title = "Нажать"
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()
    
    
    private let underlineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red // Цвет подчеркивания
        return view
    }()
    
    // MARK: - Инициализация
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) не был реализован")
    }
    
    // MARK: - Настройка UI
//    private func setupViews() {
//        contentView.addSubview(customLabel)
//        contentView.addSubview(customButton)
//        contentView.addSubview(underlineView) // Добавляем подчеркивание
//        
//        NSLayoutConstraint.activate([
//            // Constraints для label
//            customLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            customLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
//            customLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            
//            // Constraints для кнопки
//            customButton.topAnchor.constraint(equalTo: customLabel.bottomAnchor, constant: 16),
//            customButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            
//            // Подчеркивание (underlineView)
//            underlineView.topAnchor.constraint(equalTo: customButton.bottomAnchor, constant: 2), // Отступ 2
//            underlineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            underlineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            underlineView.heightAnchor.constraint(equalToConstant: 1), // Толщина линии
//            
//            // Нижний отступ contentView
//            underlineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
//        ])
//    }
    
    private func setupViews() {
        contentView.addSubview(customLabel)
        contentView.addSubview(customButton)
        contentView.addSubview(underlineView) // Добавляем линию

        NSLayoutConstraint.activate([
            // Constraints для label
            customLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            customLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            customLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            // Constraints для кнопки
            customButton.topAnchor.constraint(equalTo: customLabel.bottomAnchor, constant: 16),
            customButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            // Constraints для underlineView (линии)
            underlineView.topAnchor.constraint(equalTo: customButton.bottomAnchor, constant: 4), // Отступ от текста
            underlineView.leadingAnchor.constraint(equalTo: customButton.leadingAnchor),
            underlineView.trailingAnchor.constraint(equalTo: customButton.trailingAnchor),
            underlineView.heightAnchor.constraint(equalToConstant: 1), // Толщина линии

            // Нижний отступ contentView
            underlineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func configure(withText text: String, buttonTitle: String) {
        customLabel.text = text
        customButton.setTitle(buttonTitle, for: .normal)
    }
}
