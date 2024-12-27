//
//  ButtonsTableViewCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/30/24.
//

import UIKit

class ButtonsCell: UITableViewCell {
    
    private let menButton:   UIButton = createButton()
    private let womenButton: UIButton = createButton()
    private let kidsButton:  UIButton = createButton()
    
    private var underlineWidthConstraint: NSLayoutConstraint?
    private var underlineCenterXConstraint: NSLayoutConstraint?
    
    var menButtonAction:   ((Int) -> Void)?
    var womenButtonAction: ((Int) -> Void)?
    var kidsButtonAction:  ((Int) -> Void)?
    
    // MARK: - FullWidthUnderline
    private let fullWidthUnderlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    // MARK: - SelectedUnderlineView
    private let selectedUnderlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [menButton, womenButton, kidsButton])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
        setupButtonActions()
        
        DispatchQueue.main.async {
            self.updateUnderline(for: self.menButton)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private static func createButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func updateButtonCell(_ model: ShopButtonsModel) {
        menButton.setTitle(model.firstButtonTitle, for: .normal)
        womenButton.setTitle(model.seconrButtonTitle, for: .normal)
        kidsButton.setTitle(model.thirdButtonTitle, for: .normal)
    }
    
    private func setupButtonActions() {
        menButton.addTarget(self, action: #selector(didTapFirstButton), for: .touchUpInside)
        womenButton.addTarget(self, action: #selector(didTapSecondButton), for: .touchUpInside)
        kidsButton.addTarget(self, action: #selector(didTapThirdButton), for: .touchUpInside)
    }
    
    func configureHeight(_ height: CGFloat) {
        contentView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    private func updateUnderline(for button: UIButton) {
        let titleWidth = button.intrinsicContentSize.width
        underlineWidthConstraint?.constant = titleWidth
        underlineCenterXConstraint?.isActive = false
        underlineCenterXConstraint = selectedUnderlineView.centerXAnchor.constraint(equalTo: button.centerXAnchor)
        underlineCenterXConstraint?.isActive = true
    }
    
    @objc private func didTapFirstButton() {
        updateUnderline(for: menButton)
        menButtonAction?(0)
    }
    
    @objc private func didTapSecondButton() {
        updateUnderline(for: womenButton)
        womenButtonAction?(1)
    }
    
    @objc private func didTapThirdButton() {
        updateUnderline(for: kidsButton)
        kidsButtonAction?(2)
    }
}

// MARK: - Layout
extension ButtonsCell {
    
    func setupView() {
        contentView.addSubview(buttonStackView)
        contentView.addSubview(selectedUnderlineView)
        contentView.addSubview(fullWidthUnderlineView)
    }
    
    func setupConstraints() {
        selectedUnderlineView.translatesAutoresizingMaskIntoConstraints = false
        fullWidthUnderlineView.translatesAutoresizingMaskIntoConstraints = false
        
        underlineWidthConstraint = selectedUnderlineView.widthAnchor.constraint(equalToConstant: 0)
        underlineCenterXConstraint = selectedUnderlineView.centerXAnchor.constraint(equalTo: menButton.centerXAnchor)
        
        underlineWidthConstraint?.isActive = true
        underlineCenterXConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            
            buttonStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            buttonStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            fullWidthUnderlineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            fullWidthUnderlineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            fullWidthUnderlineView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 8),
            fullWidthUnderlineView.heightAnchor.constraint(equalToConstant: 1),
            
            selectedUnderlineView.heightAnchor.constraint(equalToConstant: 1),
            selectedUnderlineView.topAnchor.constraint(equalTo: fullWidthUnderlineView.bottomAnchor, constant: 0)
        ])
    }
}
