//
//  BagTableView.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/13/24.
//

import UIKit

class BagTableView: UITableView {
        
    var firstSectionData: [PromotionModel] = []
    var bagVCData: [TopPickModel] = []
    var thirdSectionData: [TopPickModel] = []
        
    var bagSections: [BagSections] {
        get {
            return [
                .firstSection(firstSectionData),
                .secondSection(bagVCData),
                .thirdSection(thirdSectionData)
            ]
        }
        set {
            for section in newValue {
                switch section {
                case .firstSection(let data):
                    firstSectionData = data
                case .secondSection(let data):
                    bagVCData = data
                case .thirdSection(let data):
                    thirdSectionData = data
                }
            }
        }
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        delegate = self
        dataSource = self
//        separatorStyle = .none
        allowsSelection = false
        
        registerCell(TemporaryPromotionCell.self)
        registerCell(OrdersCell.self)
        registerCell(TVPlusCVCell.self)
    }
}

// MARK: - TableViewDataSource
extension BagTableView: UITableViewDataSource {
    
    enum BagSections {
        case firstSection([PromotionModel])
        case secondSection([TopPickModel])
        case thirdSection([TopPickModel])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch bagSections[section] {
            
        case .firstSection:
//            return 1
            return firstSectionData.count
        case .secondSection:
            return bagVCData.count
        case .thirdSection:
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return bagSections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionData = bagSections[indexPath.section]
        switch sectionData {
            
        case .firstSection(let model):
            let cell = tableView.dequeuCell(indexPath) as TemporaryPromotionCell
            let model = model[indexPath.item]
            cell.update(model)
            return cell
            
        case .secondSection(let model):
            let cell = tableView.dequeuCell(indexPath) as OrdersCell
            let model = model[indexPath.row]
            cell.update(model)
            return cell
            
        case .thirdSection(let model):
            let cell = tableView.dequeuCell(indexPath) as TVPlusCVCell
            cell.updateData(model)
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension BagTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Проверяем, если секция не вторая, возвращаем nil
        guard indexPath.section == 1 else {
            return nil
        }
        
        // Кнопка "Удалить"
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] _, _, completionHandler in
            guard let self = self else { return }
            guard indexPath.row < self.bagVCData.count else { return }
            
            let model = self.bagVCData[indexPath.row] // Извлекаем модель
            self.didRequestDeleteItem(at: indexPath, model: model)
            completionHandler(true)
        }
        deleteAction.backgroundColor = .red
        
        // Вторая кнопка с другим действием
        let printAction = UIContextualAction(style: .normal, title: "Принт") { _, _, completionHandler in
            print("Принт на строке \(indexPath.row)")
            completionHandler(true)
        }
        printAction.backgroundColor = .blue
        
        // Возвращаем обе кнопки
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, printAction])
        configuration.performsFirstActionWithFullSwipe = false // Отключаем полный свайп
        return configuration
    }
}

extension BagTableView: OrdersCellDelegate {
    func didRequestDeleteItem(at indexPath: IndexPath, model: TopPickModel) {
        // Удаление из хранилища
        let updatedData = OrdersService().delete(model)
        bagVCData = updatedData
        
        // Обновление таблицы
        deleteRows(at: [indexPath], with: .automatic)
    }
}


