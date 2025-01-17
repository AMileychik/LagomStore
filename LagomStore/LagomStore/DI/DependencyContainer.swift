//
//  DependencyContainer.swift
//  LagomStore
//
//  Created by Александр Милейчик on 11/15/24.
//

import Foundation

final class DependencyContainer {
    
    let session: URLSession
    let decoder: JSONDecoder
    let loader: Loader
    
    let screenFactory: ScreenFactory
    
    init() {
        session = URLSession.shared
        decoder = JSONDecoder()
        loader = Loader(session: session, decoder: decoder)
        
        screenFactory = ScreenFactory()
        screenFactory.di = self
    }
}

final class ScreenFactory {
    
    weak var di: DependencyContainer!
    
    func makeHomescreen() -> HomeVC {
        return HomeVC(homeLoader: di.loader)
    }
    
    func makeShopScreen() -> ShopVC {
        return ShopVC(shopLoader: di.loader)
    }
    
    func makeFavoriteScreen() -> FavoritesVC {
        return FavoritesVC(favoritesLoader: di.loader)
    }
    
    func makeBagVC() -> BagVC {
        return BagVC(bagLoader: di.loader)
    }
    
    func makeDetailScreen() -> DetailVC {
        return DetailVC()
    }
}


