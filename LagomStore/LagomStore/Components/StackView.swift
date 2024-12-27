//
//  StackView.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/23/24.
//
import UIKit

enum StackViewType {
    case productCell
    case headerStackView
    case newAndFeatured
    case listHeader
}

class StackView: UIStackView {
    
    init(type: StackViewType) {
        super.init(frame: .zero)
        commonInit(type)
    }
    
    func commonInit(_ type: StackViewType) {
        switch type {
            
        case .productCell:
            axis = .vertical
            spacing = Layout.offset6
            distribution = .fill
            alignment = .leading
            
            directionalLayoutMargins = NSDirectionalEdgeInsets(top: 6, leading: 0, bottom: 0, trailing: 0)
            isLayoutMarginsRelativeArrangement = true
            backgroundColor = .systemBackground
            
        case .headerStackView:
            translatesAutoresizingMaskIntoConstraints = false
            axis = .vertical
            alignment = .leading
            spacing = 4
            
        case .newAndFeatured:
            axis = .vertical
            alignment = .leading
            spacing = 4
            
        case .listHeader:
            translatesAutoresizingMaskIntoConstraints = false
            axis = .horizontal
            distribution = .equalSpacing
            alignment = .center
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


enum StackViewType2 {
    case homePageControlSection
}

class StackView2: UIStackView {
    
    init(type2: StackViewType2, with views: [UIView]) {
        super.init(frame: .zero)
        commonInit2(type2, with: views)
    }
    
    func commonInit2(_ type2: StackViewType2, with: [UIView]) {
        switch type2 {
            
        case .homePageControlSection:
            translatesAutoresizingMaskIntoConstraints = false
            axis = .vertical
            spacing = 4
            alignment = .leading
            layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 32)
            isLayoutMarginsRelativeArrangement = true
        }
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

