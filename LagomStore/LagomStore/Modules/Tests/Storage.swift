//
//  Storage.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/4/24.
//

//protocol OrdersServiceProtocol: AnyObject {
//    func save(_ products: [Product])
//    func saveTopPicks(_ products: [TopPickModel])
//    func fetch() -> [Product]
//    func fetchTopPicks() -> [TopPickModel]
//    func add(_ product: Product) -> [Product]
//    func delete(_ product: Product) -> [Product]
//    func calculateTotalPrice() -> Int
//    func calculateTotalCount() -> Int
//    func printStorage()
//    func printtopPickStorage()
//}

//protocol OrdersServiceProtocol: AnyObject {
//    func save(_ products: [Product])
//    func saveTopPicks(_ products: [TopPickModel])
//    func fetch() -> [Product]
//    func fetchTopPicks() -> [TopPickModel]
//    func add(_ product: Product) -> [Product]
//    func delete(_ product: Product) -> [Product]
//    func deleteTopPick(_ product: TopPickModel) -> TopPickModel
////    func addTopPick(_ newTopPick: TopPickModel) -> [TopPickModel] // Добавленный метод
//    func calculateTotalPrice() -> Int
//    func calculateTotalCount() -> Int
//    func printStorage()
//    func printtopPickStorage()
//}
//
//class OrdersService: OrdersServiceProtocol {
//
//    
//    
//    private let encoder = JSONEncoder()
//    private let decoder = JSONDecoder()
//  
//    private let key = "Products"
//    private var topPicksKey = "TopPicksKey"
//    
////    func saveTopPicks(_ topPicks: [TopPickModel]) {
////        do {
////            let data = try JSONEncoder().encode(topPicks)
////            UserDefaults.standard.setValue(data, forKey: topPicksKey)
////        } catch {
////            print("Failed to save top picks: \(error)")
////        }
////    }
//    
//    
//    
//    
//    
//    
///// Sonic
////    func saveTopPicks(_ topPicks: [TopPickModel]) {
//////        do {
//////            let data = try JSONEncoder().encode(topPicks)
//////            UserDefaults.standard.set(data, forKey: "topPicks")
//////            print("Saved Top Picks: \(topPicks)")
//////        } catch {
//////            print("Failed to save Top Picks: \(error)")
//////        }
////        
////        do {
////            let data = try encoder.encode(topPicks)
////            UserDefaults.standard.setValue(data, forKey: topPicksKey)
////        } catch {
////            print("Failed to save products: \(error)")
////        }
////    }
//    
//    
//    
//    
//    
//    
//    
////    func fetchTopPicks() -> [TopPickModel] {
////        guard let data = UserDefaults.standard.data(forKey: topPicksKey) else { return [] }
////        do {
////            return try JSONDecoder().decode([TopPickModel].self, from: data)
////        } catch {
////            print("Failed to fetch top picks: \(error)")
////            return []
////        }
////    }
//
//    
//    
//    
//    func saveTopPicks(_ newTopPicks: [TopPickModel]) {
//        var currentTopPicks = fetchTopPicks() // Загрузка текущих данных
//        currentTopPicks.append(contentsOf: newTopPicks) // Добавление новых данных
//
//        do {
//            let data = try JSONEncoder().encode(currentTopPicks) // Кодирование объединенных данных
//            UserDefaults.standard.set(data, forKey: topPicksKey) // Сохранение в UserDefaults
//            print("Saved Top Picks successfully!")
//        } catch {
//            print("Failed to save Top Picks: \(error)")
//        }
//    }
//    
//    
//    func fetchTopPicks() -> [TopPickModel] {
//        guard let data = UserDefaults.standard.data(forKey: topPicksKey) else {
//            print("No data found for key: \(topPicksKey)")
//            return []
//        }
//        do {
//            let topPicks = try JSONDecoder().decode([TopPickModel].self, from: data)
// //           print("Fetched Top Picks: \(topPicks)")
//            return topPicks
//        } catch {
//            print("Failed to decode Top Picks: \(error)")
//            return []
//        }
//    }
//    
//    
//    
//    
//    
///// Sonic
////    func fetchTopPicks() -> [TopPickModel] {
////        guard let data = UserDefaults.standard.data(forKey: topPicksKey) else { return [] }
////        do {
//////            let topPicks = try JSONDecoder().decode([TopPickModel].self, from: data)
//////            print("Fetched Top Picks: \(topPicks)")
//////            return topPicks
////            return try decoder.decode([TopPickModel].self, from: data)
////        } catch {
////            print("Failed to fetch Top Picks: \(error)")
////            return []
////        }
////    }
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
////    func addTopPick(_ newTopPick: TopPickModel) -> [TopPickModel] {
////        var topPicks = fetchTopPicks()
////        topPicks.append(newTopPick)
////        saveTopPicks(topPicks)
////        return topPicks
////    }
//    
//    func save(_ products: [Product]) {
//        do {
//            let data = try encoder.encode(products)
//            UserDefaults.standard.setValue(data, forKey: key)
//        } catch {
//            print("Failed to save products: \(error)")
//        }
//    }
//    
//    func fetch() -> [Product] {
//        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
//        do {
//            return try decoder.decode([Product].self, from: data)
//        } catch {
//            print("Failed to fetch products: \(error)")
//            return []
//        }
//    }
//    
//    @discardableResult
//    func add(_ product: Product) -> [Product] {
//        var products = fetch()
//        if let index = products.firstIndex(where: { $0.id == product.id }) {
//            products[index].count += 1
//        } else {
//            products.append(product)
//        }
//        save(products)
//        return products
//    }
//    
////    @discardableResult
////    func addTopPick(_ product: TopPickModel) -> [TopPickModel] {
////        var top = fetchTopPicks()
////        if let index = top.firstIndex(where: { $0.id == top.id }) {
////            top[index].count += 1
////        } else {
////            top.append(product)
////        }
////        saveTopPicks(top)
////        return top
////    }
//    
////    @discardableResult
////    func addTopPick(_ product: TopPickModel) -> [TopPickModel] {
////        var top = fetchTopPicks()
////        if let index = top.firstIndex(where: { $0.id == product.id }) {
////            // Если элемент с таким `id` найден, увеличиваем счетчик
////            top[index].count += 1
////        } else {
////            // Если элемент не найден, добавляем новый
////            top.append(product)
////        }
////        saveTopPicks(top)
////        return top
////    }
//    
//    @discardableResult
//    func delete(_ product: Product) -> [Product] {
//        var products = fetch()
//        products.removeAll(where: { $0.id == product.id })
//        save(products)
//        return products
//    }
//    
//    @discardableResult
//    func deleteTopPick(_ product: TopPickModel) -> [TopPickModel] {
//        var products = fetchTopPicks()
//        products.removeAll(where: { $0.id == product.id })
//        saveTopPicks(products)
//        return products
//    }
//    
//    func calculateTotalPrice() -> Int {
//        fetch().reduce(0) { $0 + ($1.count * $1.price) }
//    }
//    
//    func calculateTotalCount() -> Int {
//        fetch().reduce(0) { $0 + $1.count }
//    }
//    
//    func printStorage() {
//        let products = fetch()
//        if products.isEmpty {
//            print("Storage is empty.")
//        } else {
//            print("Current Storage:")
//            products.forEach { product in
//                print("ID: \(product.id), Name: \(product.name), Price: \(product.price), Count: \(product.count)")
//            }
//        }
//    }
//    
//    func printtopPickStorage() {
//        let products = fetchTopPicks()
//        if products.isEmpty {
//            print("Storage is empty.")
//        } else {
//            print("Current Storage:")
//            products.forEach { product in
//                print("ID: \(product.id), Name: \(product.type), Price: \(product.price)")
//            }
//        }
//    }
//}


//protocol OrdersServiceProtocol: AnyObject {
//    func saveTopPicks(_ products: [TopPickModel])
//    func fetchTopPicks() -> [TopPickModel]
//    func deleteTopPick2(from products: [TopPickModel], index: IndexPath) -> [TopPickModel]
//    func deleteTopPick(_ product: [TopPickModel]) -> [TopPickModel]
//
//    func printtopPickStorage()
//}
//
//class OrdersService: OrdersServiceProtocol {
//
//    private let encoder = JSONEncoder()
//    private let decoder = JSONDecoder()
//  
//    private let key = "Products"
//    private var topPicksKey = "TopPicksKey"
//    
//    func saveTopPicks(_ newTopPicks: [TopPickModel]) {
//        var currentTopPicks = fetchTopPicks() // Загрузка текущих данных
//        currentTopPicks.append(contentsOf: newTopPicks) // Добавление новых данных
//
//        do {
//            let data = try JSONEncoder().encode(currentTopPicks) // Кодирование объединенных данных
//            UserDefaults.standard.set(data, forKey: topPicksKey) // Сохранение в UserDefaults
//            print("Saved Top Picks successfully!")
//        } catch {
//            print("Failed to save Top Picks: \(error)")
//        }
//    }
//    
//    
//    func fetchTopPicks() -> [TopPickModel] {
//        guard let data = UserDefaults.standard.data(forKey: topPicksKey) else {
//            print("No data found for key: \(topPicksKey)")
//            return []
//        }
//        do {
//            let topPicks = try JSONDecoder().decode([TopPickModel].self, from: data)
// //           print("Fetched Top Picks: \(topPicks)")
//            return topPicks
//        } catch {
//            print("Failed to decode Top Picks: \(error)")
//            return []
//        }
//    }
//    
//    
//    
//    @discardableResult
//    func deleteTopPick(_ product: [TopPickModel]) -> [TopPickModel] {
// //       var products = fetchTopPicks()
//        var upDatedProducts = product
//        upDatedProducts.removeAll(where: { $0.id != product.first?.id })
////        saveTopPicks(products)
//        return upDatedProducts
//    }
//    
////    @discardableResult
////    func deleteTopPick2(from products: [TopPickModel], index: IndexPath) -> [TopPickModel] {
////        var updatedProducts = products
////        updatedProducts.removeAll { $0.id == index.item}
//// //       saveTopPicks(products)
////        return updatedProducts
////    }
//    @discardableResult
//    func deleteTopPick2(from products: [TopPickModel], index: IndexPath) -> [TopPickModel] {
//        var updatedProducts = products
//        if index.item < updatedProducts.count {
//            updatedProducts.remove(at: index.item)
//        }
//        saveTopPicks(updatedProducts)
////        print("Before deletion: \(products)")
////        print("Index to delete: \(index.item)")
////        print("After deletion: \(updatedProducts)")
//        return updatedProducts
//    }
//    
//    
//    
//    func printtopPickStorage() {
//        let products = fetchTopPicks()
//        if products.isEmpty {
//            print("Storage is empty.")
//        } else {
//            print("Current Storage:")
//            products.forEach { product in
//                print("ID: \(product.id), Name: \(product.type), Price: \(product.price)")
//            }
//        }
//    }
//    
////    func fetchTopPicks() -> [TopPickModel] {
////        guard let data = UserDefaults.standard.data(forKey: "topPicks") else { return [] }
////        let decoder = JSONDecoder()
////        return (try? decoder.decode([TopPickModel].self, from: data)) ?? []
////    }
////
////    func saveTopPicks(_ products: [TopPickModel]) {
////        let encoder = JSONEncoder()
////        if let encoded = try? encoder.encode(products) {
////            UserDefaults.standard.set(encoded, forKey: "topPicks")
////        }
////    }
//}

