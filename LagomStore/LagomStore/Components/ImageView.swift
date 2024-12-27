//
//  ImageView.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/23/24.
//

import UIKit

//Способы создания UI-компонентов

/*
 
 1. Closure init (MVP)
 2. Компонент в отдельном файле (усложняется)
 3. Фабрика компонент - для простых кнопок, надписей
 4. Декоратор для создания компонента
 
 */

enum ImageViewType {
    case product
    case simple
    case banner
    case favorite
    case thankYou
    case newAndFeatured
    case recentlyViewed
    case nearbySection
    case alwaysPopular
}

class ImageView: UIImageView {
    
    init(type: ImageViewType) {
        super.init(frame: .zero)
        
        commonInit(type)
    }
    
    func commonInit(_ type: ImageViewType) {
        
        switch type {
            
        case .product:
            contentMode = .scaleAspectFill
            clipsToBounds = true
            layer.cornerRadius = 6
            heightAnchor.constraint(equalToConstant: 175).isActive = true
            widthAnchor.constraint(equalToConstant: 150).isActive = true
            
        case .simple:
            contentMode = .scaleAspectFill
            clipsToBounds = true
            
        case .banner:
            contentMode = .scaleAspectFill
            clipsToBounds = true
            heightAnchor.constraint(equalToConstant: 100).isActive = true
            widthAnchor.constraint(equalToConstant: 100).isActive = true
            
        case .favorite:
            contentMode = .scaleAspectFill
            clipsToBounds = true
            heightAnchor.constraint(equalToConstant: 150).isActive = true
            widthAnchor.constraint(equalToConstant: 250).isActive = true
            
        case .thankYou:
            contentMode = .scaleAspectFill
            clipsToBounds = true
            
        case .newAndFeatured:
            contentMode = .scaleAspectFill
            clipsToBounds = true
            heightAnchor.constraint(equalToConstant: 200).isActive = true
            widthAnchor.constraint(equalToConstant: 150).isActive = true
            
        case .recentlyViewed:
            contentMode = .scaleAspectFill
            clipsToBounds = true
            heightAnchor.constraint(equalToConstant: 150).isActive = true
            widthAnchor.constraint(equalToConstant: 150).isActive = true
            
        case .nearbySection:
            contentMode = .scaleAspectFill
            clipsToBounds = true
            heightAnchor.constraint(equalToConstant: 275).isActive = true
            widthAnchor.constraint(equalToConstant: 275).isActive = true
            
        case .alwaysPopular:
            contentMode = .scaleAspectFill
            clipsToBounds = true
            layer.cornerRadius = 10
            isUserInteractionEnabled = true
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//enum ImageViewType2 {
//    case product
//    case detail
//    case banner
//    case favorite
//    case thankYou
//    case thisWeekTopStories
//    case newAndFeatured
//}
//
//class ImageView2: UIImageView {
//    
//    func configure(type: ImageViewType2) {
//        switch type {
//        case .product:
//            contentMode = .scaleAspectFill
//            clipsToBounds = true
//            layer.cornerRadius = 6
//            heightAnchor.constraint(equalToConstant: 175).isActive = true
//            widthAnchor.constraint(equalToConstant: 150).isActive = true
//            
//        case .detail:
//            contentMode = .scaleAspectFill
//            clipsToBounds = true
//            
//        case .banner:
//            contentMode = .scaleAspectFill
//            clipsToBounds = true
//            heightAnchor.constraint(equalToConstant: 100).isActive = true
//            widthAnchor.constraint(equalToConstant: 100).isActive = true
//            
//        case .favorite:
//            contentMode = .scaleAspectFill
//            clipsToBounds = true
//            heightAnchor.constraint(equalToConstant: 150).isActive = true
//            widthAnchor.constraint(equalToConstant: 250).isActive = true
//            
//        case .thankYou:
//            contentMode = .scaleAspectFill
//            clipsToBounds = true
//            
//        case .thisWeekTopStories:
//            contentMode = .scaleAspectFill
//            clipsToBounds = true
//            heightAnchor.constraint(equalToConstant: 150).isActive = true
//            widthAnchor.constraint(equalToConstant: 225).isActive = true
//            
//        case .newAndFeatured:
//            contentMode = .scaleAspectFill
//            clipsToBounds = true
//            heightAnchor.constraint(equalToConstant: 265).isActive = true
//            widthAnchor.constraint(equalToConstant: 150).isActive = true
//        }
//    }
//}


enum ImageViewType2 {
    case product
    case detail
    case banner
    case favorite
    case thankYou
    case thisWeekTopStories
    case newAndFeatured
}

class ImageView2: UIImageView {
    
    func configure(type: ImageViewType2) {
        switch type {
        case .product:
            contentMode = .scaleAspectFill
            clipsToBounds = true
            layer.cornerRadius = 6
            heightAnchor.constraint(equalToConstant: 175).isActive = true
            widthAnchor.constraint(equalToConstant: 50).isActive = true
            
        case .detail:
            contentMode = .scaleAspectFill
            clipsToBounds = true
            
        case .banner:
            contentMode = .scaleAspectFill
            clipsToBounds = true
//            heightAnchor.constraint(equalToConstant: 100).isActive = true
//            widthAnchor.constraint(equalToConstant: 100).isActive = true
            heightAnchor.constraint(equalToConstant: 175).isActive = true
            widthAnchor.constraint(equalToConstant: 150).isActive = true
            
        case .favorite:
            contentMode = .scaleAspectFill
            clipsToBounds = true
            heightAnchor.constraint(equalToConstant: 150).isActive = true
            widthAnchor.constraint(equalToConstant: 250).isActive = true
            
        case .thankYou:
            contentMode = .scaleAspectFill
            clipsToBounds = true
            
        case .thisWeekTopStories:
            contentMode = .scaleAspectFill
            clipsToBounds = true
            heightAnchor.constraint(equalToConstant: 75).isActive = true
            widthAnchor.constraint(equalToConstant: 150).isActive = true
            
        case .newAndFeatured:
            contentMode = .scaleAspectFill
            clipsToBounds = true
            heightAnchor.constraint(equalToConstant: 200).isActive = true
            widthAnchor.constraint(equalToConstant: 200).isActive = true
        }
    }
}
