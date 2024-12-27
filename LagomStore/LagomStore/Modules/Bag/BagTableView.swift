//
//  BagTableView.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/13/24.
//

import UIKit

/*
 
 Ошибка говорит о том, что Auto Layout не может удовлетворить наложенные ограничения. В данном случае высота вашего UICollectionView зафиксирована как 400, но это конфликтует с другими constraints.

 Как исправить:

 1. Проверьте конфликтующие ограничения

 Убедитесь, что нет других ограничений, которые пытаются изменить высоту UICollectionView, например:
     •    Другое фиксированное ограничение на высоту.
     •    Ограничения сверху, снизу или пропорциональные, которые конфликтуют с высотой 400.

 Используйте инструмент отладки View Debugging в Xcode:
     •    Запустите приложение.
     •    Нажмите Debug View Hierarchy.
     •    Найдите конфликты в разделе constraints.

 2. Сделайте ограничения более гибкими

 Если UICollectionView должен менять размер динамически:
     •    Уберите фиксированное ограничение на высоту (height == 400).
     •    Вместо этого используйте ограничения, например:

 collectionView.topAnchor.constraint(equalTo: someView.topAnchor).isActive = true
 collectionView.bottomAnchor.constraint(equalTo: someView.bottomAnchor).isActive = true

 3. Приоритеты ограничений

 Если высота 400 необходима, попробуйте задать ей меньший приоритет:

 collectionView.heightAnchor.constraint(equalToConstant: 400).priority = .defaultLow

 4. Проверка контента

 Если высота коллекции зависит от её содержимого, убедитесь, что:
     •    Вы правильно настроили UICollectionView для работы с динамическим контентом.
     •    Используется метод collectionView.contentSize для определения её размера, если высота не фиксированная.

 Если не получится разобраться, можно показать полный код настроек UICollectionView и её constraints — помогу подробнее!
 
 */














class BagTableView: UITableView {
    
    var firstSectionData: [PromotionModel] = []
    var bagVCData: [TopPickModel] = []
    var thirdSectionData: [TopPickModel] = []
    
    //   var bagSections: [BagSections]  = []
    
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
        //       separatorStyle = .none
        allowsSelection = false
        
        //        tableView.rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 425
        //        tableView.beginUpdates()
        //        tableView.endUpdates()
                
        //        tableView.estimatedRowHeight = 300
        rowHeight = UITableView.automaticDimension
        
        registerCell(TemporaryPromotionCell.self)
        registerCell(OrdersCell.self)
        registerCell(TVPlusCVCell.self)
    }
    
}

// MARK: - UITableViewDataSource
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
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        let sectionData = bagSections[indexPath.section]
    //        switch sectionData {
    //
    //        case .firstSection:
    //            return 200
    //        case .secondSection:
    //            return 200
    //        case .thirdSection:
    //            return 300
    //        }
    //    }
    
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





























//class BagTableView: UITableView {
//    
//    var firstSectionData: [PromotionModel] = []
//    var bagVCData: [TopPickModel] = []
//    var thirdSectionData: [TopPickModel] = []
//
//
//
////    var bagSections: [BagSections] {
////        
////        [
////            .firstSection(firstSectionData),
////            .secondSection(bagVCData),
////            .thirdSection(thirdSectionData)
////        ]
////    }
//    
// 
//        var bagSections: [BagSections] {
//            get {
//                return [
//                    .firstSection(firstSectionData),
//                    .secondSection(bagVCData),
//                    .thirdSection(thirdSectionData)
//                ]
//            }
//            set {
//                for section in newValue {
//                    switch section {
//                    case .firstSection(let data):
//                        firstSectionData = data
//                    case .secondSection(let data):
//                        bagVCData = data
//                    case .thirdSection(let data):
//                        thirdSectionData = data
//                    }
//                }
//            }
//        }
//        
//
//    
//    
//    
//    
//    
//    
//    
//    
//        
//    override init(frame: CGRect, style: UITableView.Style) {
//        super.init(frame: frame, style: style)
//        commonInit()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func commonInit() {
//        delegate = self
//        dataSource = self
//        
// //       separatorStyle = .none
//        allowsSelection = false
//        
//        registerCell(OrdersCell.self)
//        registerCell(ThankYouCell.self)
//        registerCell(TemporaryPromotionCell.self)
//        
//        registerCell(TVPlusCVCell.self)
//    }
//    
//}
//
//// MARK: - UITableViewDelegate
////extension BagTableView: UITableViewDelegate {}
//
////extension BagTableView: UITableViewDelegate {
////    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
////        // Кнопка "Удалить"
////        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] _, _, completionHandler in
////            guard let self = self else { return }
////            self.didRequestDeleteItem(at: indexPath)
////            completionHandler(true)
////        }
////        deleteAction.backgroundColor = .red
////        
////        // Вторая кнопка с другим действием
////        let printAction = UIContextualAction(style: .normal, title: "Принт") { _, _, completionHandler in
////            print("Принт на строке \(indexPath.row)")
////            completionHandler(true)
////        }
////        printAction.backgroundColor = .blue
////        
////        // Возвращаем обе кнопки
////        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, printAction])
////        configuration.performsFirstActionWithFullSwipe = false // Отключаем полный свайп
////        return configuration
////    }
////}
//
////extension BagTableView: UITableViewDelegate {
////    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
////        // Кнопка "Удалить"
////        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] _, _, completionHandler in
////            guard let self = self else { return }
////            guard indexPath.row < self.bagVCData.count else { return }
////            
////            let model = self.bagVCData[indexPath.row] // Извлекаем модель
////            self.didRequestDeleteItem(at: indexPath, model: model)
////            completionHandler(true)
////        }
////        deleteAction.backgroundColor = .red
////        
////        // Вторая кнопка с другим действием
////        let printAction = UIContextualAction(style: .normal, title: "Принт") { _, _, completionHandler in
////            print("Принт на строке \(indexPath.row)")
////            completionHandler(true)
////        }
////        printAction.backgroundColor = .blue
////        
////        // Возвращаем обе кнопки
////        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, printAction])
////        configuration.performsFirstActionWithFullSwipe = false // Отключаем полный свайп
////        return configuration
////    }
////}
//
//
//extension BagTableView: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        // Проверяем, если секция не вторая, возвращаем nil
//        guard indexPath.section == 1 else {
//            return nil
//        }
//        
//        // Кнопка "Удалить"
//        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] _, _, completionHandler in
//            guard let self = self else { return }
//            guard indexPath.row < self.bagVCData.count else { return }
//            
//            let model = self.bagVCData[indexPath.row] // Извлекаем модель
//            self.didRequestDeleteItem(at: indexPath, model: model)
//            completionHandler(true)
//        }
//        deleteAction.backgroundColor = .red
//        
//        // Вторая кнопка с другим действием
//        let printAction = UIContextualAction(style: .normal, title: "Принт") { _, _, completionHandler in
//            print("Принт на строке \(indexPath.row)")
//            completionHandler(true)
//        }
//        printAction.backgroundColor = .blue
//        
//        // Возвращаем обе кнопки
//        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, printAction])
//        configuration.performsFirstActionWithFullSwipe = false // Отключаем полный свайп
//        return configuration
//    }
//}
//
//
//
//
//












//
//
//// MARK: - UITableViewDataSource
//extension BagTableView: UITableViewDataSource {
//    
//    enum BagSections {
//        case firstSection([PromotionModel])
//        case secondSection([TopPickModel])
//        case thirdSection([TopPickModel])
//    }
//   
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
// //       return bagVCData.count
// //       return 1
//        
//        switch bagSections[section] {
//            
//        case .firstSection:
//            return firstSectionData.count
//        case .secondSection:
//            return bagVCData.count
//        case .thirdSection:
//            return 1
//        }
//    }
//    
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeuCell(indexPath) as Orders
////        let model = bagVCData[indexPath.item]
////        cell.updateData([model])
//////        cell.update(model)
////        
////        
////        return cell
////    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
////        return bagVCData.count
//        return bagSections.count
//    }
//    
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        let sectionData = bagSections[indexPath.section]
////        switch sectionData {
////            
////        case .firstSection:
////            return 200
////        case .secondSection:
////            return 200
////        case .thirdSection:
////            return 300
////        }
////    }
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            
//            
////            let cell = tableView.dequeuCell(indexPath) as Orders
////            let model = bagVCData[indexPath.row]
////            cell.configure(delegate: self, indexPath: indexPath, model: [model])
////  //          cell.update(model)
////            return cell
////            
//            let sectionData = bagSections[indexPath.section]
//            switch sectionData {
//                
//                
//            case .firstSection(let model):
//                let cell = tableView.dequeuCell(indexPath) as TemporaryPromotionCell
//                let model = model[indexPath.item]
//                cell.update(model)
//                return cell
//                
//            case .secondSection(let model):
//                let cell = tableView.dequeuCell(indexPath) as OrdersCell
//                let model = model[indexPath.row]
//      //          cell.configure(delegate: self, indexPath: indexPath, model: [model])
//                cell.update(model)
//                return cell
//                
//            case .thirdSection(let model):
//                let cell = tableView.dequeuCell(indexPath) as TVPlusCVCell
////                let model = model[indexPath.item]
//                cell.updateData(model)
////                cell.update(model)
//                
//                return cell
//            }
//
//    }
//}
















//extension BagTableView: OrdersCellDelegate {
////    func didRequestDeleteItem(at indexPath: IndexPath) {
////        guard indexPath.row < bagVCData.count else { return }
////        bagVCData.remove(at: indexPath.row)
////        deleteRows(at: [indexPath], with: .automatic)
//////        reloadData()
////        
//////        let updatedData = self.orderService.delete(model)
//////        self.data = updatedData
////    }
//    
//    func didRequestDeleteItem(at indexPath: IndexPath) {
//        guard indexPath.row < bagVCData.count else { return }
//        bagVCData.remove(at: indexPath.row)
//        reloadData()
//    }
//}

//extension BagTableView: OrdersCellDelegate {
//    func didRequestDeleteItem(at indexPath: IndexPath) {
//        guard indexPath.row < bagVCData.count else { return }
//        bagVCData.remove(at: indexPath.row)
//        deleteRows(at: [indexPath], with: .automatic)
//    }
//}

//extension BagTableView: OrdersCellDelegate {
//    func didRequestDeleteItem(at indexPath: IndexPath, model: TopPickModel) {
//        let updatedData = OrdersService().delete(model) // Удаляем из хранилища
//        bagVCData = updatedData // Обновляем локальные данные
//        deleteRows(at: [indexPath], with: .automatic)
//    }
//}

extension BagTableView: OrdersCellDelegate {
    func didRequestDeleteItem(at indexPath: IndexPath, model: TopPickModel) {
        // Удаление из хранилища
        let updatedData = OrdersService().delete(model)
        bagVCData = updatedData
        
        // Обновление таблицы
        deleteRows(at: [indexPath], with: .automatic)
    }
}


