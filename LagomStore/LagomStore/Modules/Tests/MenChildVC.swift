//
//  FirstChildViewController.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/20/24.
//

//import UIKit
//
//class MenChildVC: UIViewController {
//    
//    private var tableView: UITableView!
//    private var menDataModels: [MenSections] = 
//    [
//        .thisWeekTop,
//        .newAndFeatured,
//        .simpleTable
//    ]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupTableView()
//    }
//    
//    private func setupTableView() {
//        tableView = UITableView(frame: .zero, style: .plain)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.isScrollEnabled = false
//        
// //       tableView.registerCell(ThisWeekTopTableViewCell.self)
//        tableView.registerCell(NewAndFeaturedTableViewCell.self)
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
//        
//        view.addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//}
//
//// MARK: - UITableViewDataSource
//extension MenChildVC: UITableViewDataSource {
//    
//    enum MenSections: Int, CaseIterable {
//        case thisWeekTop
//        case newAndFeatured
//        case simpleTable
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return menDataModels.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch menDataModels[section] {
//        case .thisWeekTop:
//            return 1 // Одна строка для thisWeekTop
//        case .simpleTable:
//            return 4 // Четыре строки для простой таблицы
//        case .newAndFeatured:
//            return 1
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let sectionsData = menDataModels[indexPath.section]
//        switch sectionsData {
//            
//        case .thisWeekTop:
//            
//            let cell = tableView.dequeuCell(indexPath) as OrthogonalScrollingLayoutCell
//            
//            return cell
//
//            
//        case .simpleTable:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
//            cell.textLabel?.text = "Row \(indexPath.row + 1)" // Заполняем ячейки простой таблицы
//            return cell
//           
//        case .newAndFeatured:
//            
//            
//            let cell = tableView.dequeuCell(indexPath) as NewAndFeaturedTableViewCell
//            cell.removeSection = { [weak self] in
//                guard let self = self else { return }
//                self.removeSection(at: indexPath.section)
//            }
//            return cell
//        }
//    }
//    
//    // MARK: - Delete section
//    func removeSection(at index: Int) {
//        // Удаление секции и обновление таблицы
//        menDataModels.remove(at: index)
//        tableView.beginUpdates()
//        tableView.deleteSections(IndexSet(integer: index), with: .fade)
//        tableView.endUpdates()
//    }
//}
//
//// MARK: - UITableViewDelegate
//extension MenChildVC: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch menDataModels[indexPath.section] {
//        case .thisWeekTop:
//            return 400 // Высота для строки thisWeekTop
//        case .simpleTable:
//            return 50 // Стандартная высота для строк простой таблицы
//        case .newAndFeatured:
//            return 400
//        }
//    }
//}
