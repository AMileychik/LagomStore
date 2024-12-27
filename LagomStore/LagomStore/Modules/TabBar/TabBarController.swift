//
//  MainTabBarController.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/9/24.
//

import UIKit

let di = DependencyContainer()

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = di.screenFactory.makeHomescreen()
        let shopVC = di.screenFactory.makeShopScreen()
        let favoriteVC = di.screenFactory.makeFavoriteScreen()
        let bagVC = di.screenFactory.makeBagVC()
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        shopVC.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(systemName: "square"), tag: 1)
        favoriteVC.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "house"), tag: 2)
        bagVC.tabBarItem = UITabBarItem(title: "Bag", image: UIImage(systemName: "square"), tag: 3)
        
        let tabBarList = [homeVC, shopVC, favoriteVC, bagVC]
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.selectedIndex = 1
    }
}


