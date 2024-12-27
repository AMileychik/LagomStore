//
//  OrdersService.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/13/24.
//

import UIKit

protocol OrdersServiceProtocol: AnyObject {
    func saveAndAdd(_ products: [TopPickModel])
    func printtopPickStorage()
    
    //    func save(_ products: TopPickModel)
    func fetch() -> [TopPickModel]
    func delete(_ product: TopPickModel) -> [TopPickModel]
    func fetchTopPicks() -> [TopPickModel]
}

class OrdersService: OrdersServiceProtocol {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    //    private let key = "Products"
    private var topPicksKey = "TopPicksKey"
    
    // MARK: - SaveAndAdd
    func saveAndAdd(_ newTopPicks: [TopPickModel]) {
        var currentTopPicks = fetch() // Загрузка текущих данных
        currentTopPicks.append(contentsOf: newTopPicks) // Добавление новых данных
        
        do {
            let data = try JSONEncoder().encode(currentTopPicks) // Кодирование объединенных данных
            UserDefaults.standard.set(data, forKey: topPicksKey) // Сохранение в UserDefaults
            print("Saved Top Picks successfully!")
        } catch {
            print("Failed to save Top Picks: \(error)")
        }
    }
    
    func save(_ newTopPicks: [TopPickModel]) {
        //var currentTopPicks = fetch() // Загрузка текущих данных
        //urrentTopPicks.append(newTopPicks)
        //print("\(currentTopPicks)")
        do {
            let data = try encoder.encode(newTopPicks)
            UserDefaults.standard.set(data, forKey: topPicksKey)
            
        } catch {
            print(error)
        }
    }
    
    // MARK: - Fetch
    func fetch() -> [TopPickModel] {
        
        guard let data = UserDefaults.standard.data(forKey: topPicksKey) else { return [] }
        
        do {
            let array = try decoder.decode([TopPickModel].self, from: data)
            return array
        } catch {
            print(error)
        }
        return []
    }
    
    func fetchTopPicks() -> [TopPickModel] {
        guard let data = UserDefaults.standard.data(forKey: topPicksKey) else {
            print("No data found for key: \(topPicksKey)")
            return []
        }
        do {
            let topPicks = try JSONDecoder().decode([TopPickModel].self, from: data)
            //           print("Fetched Top Picks: \(topPicks)")
            return topPicks
        } catch {
            print("Failed to decode Top Picks: \(error)")
            return []
        }
    }
    
    // MARK: - Delete
    @discardableResult
    
    func delete(_ product: TopPickModel) -> [TopPickModel] {
        
        var products = fetchTopPicks()
        print(products.count)
        products.removeAll(where: { $0.id == product.id })
        //        if let index = products.firstIndex(where: { $0.id == product.id } ) {
        //            //products[index].count -= 1
        //
        //            //if products.count <= 0 {
        //                products.remove(at: index)
        //            //}
        //        }
        print(products.count)
        save(products)
        
        return products
    }
    
    func printtopPickStorage() {
        let products = fetch()
        if products.isEmpty {
            print("Storage is empty.")
        } else {
            print("Current Storage:")
            products.forEach { product in
                print("ID: \(product.id), Name: \(product.type), Price: \(product.price)")
            }
        }
    }
}


//import Foundation
//
//protocol OrdersServiceProtocol: AnyObject {
//    func save(_ products: [Product])
//    func fetch() -> [Product]
//    func add(_ product: Product) -> [Product]
//    func delete(_ product: Product) -> [Product]
//    func calculateTotalPrice() -> Int
//    func calculateTotalCount() -> Int
//}
//
//class OrdersService: OrdersServiceProtocol {
//    private let networkClient: NetworkClientProtocol
//    private let decoder: JSONDecoder
//    
//    init(networkClient: NetworkClientProtocol, decoder: JSONDecoder = JSONDecoder()) {
//        self.networkClient = networkClient
//        self.decoder = decoder
//    }
//    
//    private let encoder = JSONEncoder()
//   // private let decoder = JSONDecoder()
//    
//    private let key = "Products"
//    
//    func save(_ products: [Product]) {
//        do {
//            let data = try encoder.encode(products)
//            UserDefaults.standard.setValue(data, forKey: key)
//        } catch {
//            print(error)
//        }
//    }
//    
//    func fetch() -> [Product] {
//        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
//        do {
//            let array = try decoder.decode(Array<Product>.self, from: data)
//            return array
//        } catch {
//            print(error)
//        }
//        return []
//    }
//    
//    @discardableResult
//    func add(_ product: Product) -> [Product] {
//        var products = fetch()
//        
//        if let index = products.firstIndex(where: { $0.id == product.id } ) {
//            products[index].count += 1
//        } else {
//            products.append(product)
//        }
//        
//        save(products)
//        return products
//    }
//    
//    func delete(_ product: Product) -> [Product] {
//        var products = fetch()
//        products.removeAll(where: { $0.id == product.id })
//        if let index = products.firstIndex(where: { $0.id == product.id } ) {
//            products[index].count -= 1
//            
//            if products.count <= 0 {
//                products.remove(at: index)
//            }
//        }
//        save(products)
//        return products
//    }
//    
//    func calculateTotalPrice() -> Int {
//        let products = fetch()
//        var totalPrice = 0
//        
//        for product in products {
//            totalPrice += product.count * product.price
//        }
//        return totalPrice
//    }
//    
//    func calculateTotalCount() -> Int {
//        let products = fetch()
//        var totalCount = 0
//        
//        for product in products {
//            totalCount += product.count
//        }
//        return totalCount
//    }
//}



















