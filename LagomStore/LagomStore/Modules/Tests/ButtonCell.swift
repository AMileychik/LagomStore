//
//  ButtonCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/20/24.
//

import UIKit

class ButtonCell: UICollectionViewCell {
    
    var buttonTapAction: ((Int) -> Void)?
    
    // Полоска под активной кнопкой
    private let selectedUnderlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Полоска по всей ширине экрана
    private let fullWidthUnderlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let firstButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button One", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
 
    private let secondButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Butt 2", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
 
    private let thirdButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("B 3", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
 
    private lazy var buttonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [firstButton, secondButton, thirdButton])
        stack.axis = .horizontal
        stack.spacing = 20 // Минимальное расстояние между кнопками
        stack.distribution = .fill // Кнопки занимают ровно столько места, сколько им нужно
 //       stack.alignment = .leading // Выравнивание по левому краю
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // Переменные для констрейнтов
    private var underlineWidthConstraint: NSLayoutConstraint?
    private var underlineCenterXConstraint: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(buttonStackView)
        contentView.addSubview(selectedUnderlineView)
        contentView.addSubview(fullWidthUnderlineView)
        setupConstraints()
        setupButtonActions()
        
        // При загрузке активируем первую кнопку
        DispatchQueue.main.async {
            self.updateUnderline(for: self.firstButton)
        }
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            buttonStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            buttonStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            // Серая полоска по всей ширине экрана
            fullWidthUnderlineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            fullWidthUnderlineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            fullWidthUnderlineView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 8),
            fullWidthUnderlineView.heightAnchor.constraint(equalToConstant: 1),
 
            // Черная полоска под кнопками
            selectedUnderlineView.heightAnchor.constraint(equalToConstant: 2),
            selectedUnderlineView.topAnchor.constraint(equalTo: fullWidthUnderlineView.bottomAnchor, constant: 0)
        ])
        
        // Устанавливаем начальные констрейнты для полоски
        underlineWidthConstraint = selectedUnderlineView.widthAnchor.constraint(equalToConstant: 0)
        underlineCenterXConstraint = selectedUnderlineView.centerXAnchor.constraint(equalTo: firstButton.centerXAnchor)
        
        underlineWidthConstraint?.isActive = true
        underlineCenterXConstraint?.isActive = true
    }
 
    private func setupButtonActions() {
        firstButton.addTarget(self, action: #selector(didTapFirstButton), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(didTapSecondButton), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(didTapThirdButton), for: .touchUpInside)
    }
 
    private func updateUnderline(for button: UIButton) {
        // Рассчитываем ширину текста в кнопке
//        let title = button.title(for: .normal) ?? ""
//        let titleWidth = title.size(withAttributes: [NSAttributedString.Key.font: button.titleLabel?.font ?? UIFont.systemFont(ofSize: 16)]).width
//        let titleWidth = button.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: button.frame.height)).width
        
        let titleWidth = button.intrinsicContentSize.width
        
        // Обновляем только констрейнты ширины и позиции полоски
        underlineWidthConstraint?.constant = titleWidth
        underlineCenterXConstraint?.isActive = false
        underlineCenterXConstraint = selectedUnderlineView.centerXAnchor.constraint(equalTo: button.centerXAnchor)
        underlineCenterXConstraint?.isActive = true
    }
 
    @objc private func didTapFirstButton() {
        updateUnderline(for: firstButton)
        buttonTapAction?(0)
    }
 
    @objc private func didTapSecondButton() {
        updateUnderline(for: secondButton)
        buttonTapAction?(1)
    }
 
    @objc private func didTapThirdButton() {
        updateUnderline(for: thirdButton)
        buttonTapAction?(2)
    }
}


