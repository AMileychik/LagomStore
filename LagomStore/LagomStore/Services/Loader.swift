//
//  TopPicksLoader.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/3/24.
//

import Foundation

enum NetworkError: Error {
    case statusCode
}

protocol IProductsLoader {
    func loadProducts(completion: @escaping (Result<RootModel, Error>) -> ())
}

final class Loader: IProductsLoader {
    
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    func loadProducts(completion: @escaping (Result<RootModel, Error>) -> ()) {
        
        guard let url = URL(string: "http://localhost:3001/topPicks") else { return }
        
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { data, response, error in
            
            if error != nil {
                completion(.failure(NetworkError.statusCode))
            }
            
            guard let data else { return }
            
            do {
                let products = try self.decoder.decode(RootModel.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(products))
                }
                
            } catch {
                
            }
        }.resume()
    }
}






//enum NetworkError2: Error {
//    case statusCode
//}
//
////protocol ILoader2 {
////    func loadData(completion: @escaping (Result<RootModel2, Error>) -> ())
////}
//
//final class Loader2: ILoader2 {
//    
//    private let session: URLSession
//    private let decoder: JSONDecoder
//    
//    init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
//        self.session = session
//        self.decoder = decoder
//    }
//    
//    func loadData(completion: @escaping (Result<RootModel2, Error>) -> ()) {
//        
//        guard let url = URL(string: "http://localhost:3001/topPicks") else { return }
//        
//        let request = URLRequest(url: url)
//        
//        session.dataTask(with: request) { data, response, error in
//            
//            if error != nil {
//                completion(.failure(NetworkError.statusCode))
//            }
//            
//            guard let data else { return }
//            
//            do {
//                let products = try self.decoder.decode(RootModel2.self, from: data)
//                
//                DispatchQueue.main.async {
//                    completion(.success(products))
//                }
//                
//            } catch {
//                
//            }
//        }.resume()
//    }
//}
