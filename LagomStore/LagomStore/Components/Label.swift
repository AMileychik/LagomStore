//
//  Label.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/23/24.
//

import UIKit

//Для простых компонентов - используют фабрику компонентов
//Сложные компоненты - проектируются в отдельных файлах (дизайн, анимация, темная/светлая тема)

//Configure UI Element

enum LabelType {
    case name
    case description
    case price
    case priceLabel
    case banner
    case title
    case subtitle
    case alwaysPopular
    case alwaysPopularBolt
    case alwaysPopularHeader
}

class Label: InsetLabel {
    
    //Кастомный инициализатор
    init(type: LabelType, text: String = "") {
        super.init(frame: .zero)
        
        commonInit(type, text)
    }
    
    func commonInit(_ type: LabelType, _ text: String = "") {
        switch type {
            
        case .name:
            self.text = text
            font = UIFont.boldSystemFont(ofSize: 24)
            translatesAutoresizingMaskIntoConstraints = false
            
        case .description:
            self.text = text
            font = UIFont.systemFont(ofSize: 16)
            numberOfLines = 0
            translatesAutoresizingMaskIntoConstraints = false

        case .price:
            self.text = text
            font = UIFont.boldSystemFont(ofSize: 15)
            backgroundColor = .lightGray.withAlphaComponent(0.5)
            contentInset = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
            layer.cornerRadius = 16
            clipsToBounds = true
            
        case .priceLabel:
            
            font = UIFont.systemFont(ofSize: 14)
            numberOfLines = 0
            
        case .banner:
            self.text = text
            //           font = UIFont.boldSystemFont(ofSize: 16)
            font = UIFont.systemFont(ofSize: 16, weight: .bold)
            translatesAutoresizingMaskIntoConstraints = false
            numberOfLines = 0
            
        case .title:
            translatesAutoresizingMaskIntoConstraints = false
            font = UIFont.systemFont(ofSize: 16, weight: .bold)
            numberOfLines = 0
            
        case .subtitle:
            translatesAutoresizingMaskIntoConstraints = false
            font = UIFont.systemFont(ofSize: 14, weight: .regular)
            numberOfLines = 0
            
        case .alwaysPopular:
            numberOfLines = 0
            textColor = .white
            font = UIFont.systemFont(ofSize: 13)
            translatesAutoresizingMaskIntoConstraints = false
       
        case .alwaysPopularBolt:
            numberOfLines = 0
            textColor = .white
            font = UIFont.systemFont(ofSize: 14, weight: .bold)
            translatesAutoresizingMaskIntoConstraints = false
            
        case .alwaysPopularHeader:
            numberOfLines = 0
            textColor = .white            
            font = UIFont.boldSystemFont(ofSize: 24)
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


enum LabelType2 {
    case name
    case description
    case price
    case banner
    case title
    case subtitle
}

class Label2: InsetLabel {
    
    func configure(type: LabelType2) {
        switch type {
        
        case .name:
            self.text = text
            font = UIFont.boldSystemFont(ofSize: 24)
            
        case .description:
            self.text = text
            font = UIFont.systemFont(ofSize: 16)
            
        case .price:
            self.text = text
            font = UIFont.boldSystemFont(ofSize: 15)
            backgroundColor = .lightGray.withAlphaComponent(0.5)
            contentInset = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
            layer.cornerRadius = 16
            clipsToBounds = true
            //widthAnchor.constraint(equalToConstant: 100).isActive = true
            
        case .banner:
            self.text = text
            font = UIFont.boldSystemFont(ofSize: 22)
            
        case .title:
            translatesAutoresizingMaskIntoConstraints = false
            font = UIFont.systemFont(ofSize: 16, weight: .bold)
            numberOfLines = 0
        
        case .subtitle:
            translatesAutoresizingMaskIntoConstraints = false
            font = UIFont.systemFont(ofSize: 14, weight: .regular)
            numberOfLines = 0
        }
    }
}
