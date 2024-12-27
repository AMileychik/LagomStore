//
//  MainVC.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/4/24.
//

import UIKit


struct RootModel2: Decodable {
    let product: [Product]
}

//struct TopPickModel: Codable {
//    let id: Int
//    let image: String
//    let description: String
//    let type: String
//    let price: String
//    let categories: [Categories]?
//    let listCategories: [ListModel]?
//    let categoryName: String?
//    let detailButtonsName: DetailButtonsModel?
//    let pagecontrolModel: [PageControlModel]?
////    var count: Int
//}

struct Product: Codable {
    let id: Int
    let name: String
    let price: Int
    var count: Int
}

struct MockData {
    static let products: [Product] = [
        Product(id: 1, name: "Pro", price: 100, count: 1),
        Product(id: 2, name: "Pro 2", price: 200, count: 2),
        Product(id: 3, name: "Pro 5", price: 300, count: 3)
    ]
}


// MARK: - ILoader2
protocol ILoader2 {
    func loadData(completion: @escaping (Result<RootModel2, Error>) -> Void)
}

class MockLoader: ILoader2 {
    func loadData(completion: @escaping (Result<RootModel2, Error>) -> Void) {
        completion(.success(RootModel2(product: MockData.products)))
    }
}


final class MainVC: UIViewController {
    
    private let ordersService: OrdersServiceProtocol = OrdersService()
    private let loader: ILoader2 = MockLoader()
   
    private let button: UIButton = UIButton(type: .system)
    private let checkStorageButton: UIButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButton()
        setupCheckStorageButton()
    }
    
    private func setupCheckStorageButton() {
        checkStorageButton.setTitle("Проверить хранилище", for: .normal)
        checkStorageButton.addTarget(self, action: #selector(checkStorage), for: .touchUpInside)
        checkStorageButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(checkStorageButton)
        
        NSLayoutConstraint.activate([
            checkStorageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkStorageButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            checkStorageButton.heightAnchor.constraint(equalToConstant: 50),
            checkStorageButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc private func checkStorage() {
//        ordersService.printStorage()
    }
    
    private func setupButton() {
        button.setTitle("Отправить данные", for: .normal)
        button.addTarget(self, action: #selector(sendMockData), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    //        @objc private func sendMockData() {
    //            // Отправляем MockData в хранилище
    //            MockData.products.forEach { product in
    //                ordersService.save([product])
    //            }
    //            // Переходим к FavoritesVC
    //            let favoritesVC = FavoritesVC(loader: loader, ordersService: ordersService)
    //            navigationController?.pushViewController(favoritesVC, animated: true)
    //        }
    
    @objc private func sendMockData() {
        // Найти продукт с id = 2 и отправить его
        if let productToSend = MockData.products.first(where: { $0.id == 1 }) {
//            ordersService.save([productToSend])
//            print("Product with ID has been sent to storage.")
        } else {
            print("Product with ID not found.")
        }
        // Переходим к FavoritesVC
//        let favoritesVC = FavoritesVC(loader: loader, ordersService: ordersService)
//        navigationController?.pushViewController(favoritesVC, animated: true)
    }
    
    
}
