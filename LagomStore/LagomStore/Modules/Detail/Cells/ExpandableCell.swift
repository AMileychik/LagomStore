import UIKit

class ExpandableCell: UITableViewCell {
    
    var expandButtonTapped: (() -> Void)?
    
    private var isExpanded: Bool = false {
        didSet {
            updateCellState()
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var expandButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 18) // Шрифт для стрелочек
        button.setTitle(">", for: .normal) // Стрелка вправо
        button.setTitleColor(.black, for: .normal) // Цвет стрелки
        button.addTarget(self, action: #selector(toggleExpand), for: .touchUpInside)
        return button
    }()
    
    private let contentViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    private let additionalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    private func updateCellState() {
        contentViewContainer.isHidden = !isExpanded
        expandButton.setTitle(isExpanded ? "ʌ" : "v", for: .normal)
    }
    
    @objc private func toggleExpand() {
        isExpanded.toggle()
        expandButtonTapped?()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Сброс состояния ячейки
        isExpanded = false
        
        // Очистка текстов меток
        titleLabel.text = nil
        contentLabel.text = nil
        additionalLabel.text = nil
    }
}

// MARK: - Public
extension ExpandableCell {
    func update(with title: String, buttonTitle: String, additionalLabel: String? = nil, isExpanded: Bool) {
        titleLabel.text = title
        contentLabel.text = buttonTitle
        self.additionalLabel.text = additionalLabel
        self.isExpanded = isExpanded
        setupViews()
        setupConstraints()
    }
}
 
//MARK: - Layout
extension ExpandableCell {
    
    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(expandButton)
        contentView.addSubview(contentViewContainer) // Добавляем контейнер для содержимого
        contentViewContainer.addSubview(contentLabel)
        contentViewContainer.addSubview(additionalLabel)
    }
    
   private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            expandButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16), // Перемещаем стрелку вправо
            expandButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            contentViewContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentViewContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            contentViewContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            contentLabel.leadingAnchor.constraint(equalTo: contentViewContainer.leadingAnchor),
            contentLabel.topAnchor.constraint(equalTo: contentViewContainer.topAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: contentViewContainer.trailingAnchor),
            
            additionalLabel.leadingAnchor.constraint(equalTo: contentViewContainer.leadingAnchor),
            additionalLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 8),
            additionalLabel.trailingAnchor.constraint(equalTo: contentViewContainer.trailingAnchor)
        ])
    }
}
