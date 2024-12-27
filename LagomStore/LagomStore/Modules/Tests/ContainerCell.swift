//
//  ContainerCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/20/24.
//

import UIKit

class ContainerCell: UICollectionViewCell {

//    weak var parentViewController: UIViewController?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func addChildViewController(at index: Int) {
//        // Удаляем все дочерние контроллеры из parentViewController
//        parentViewController?.children.forEach { child in
//            child.willMove(toParent: nil)
//            child.view.removeFromSuperview()
//            child.removeFromParent()
//        }
//
//        let childVC = createChildViewController(for: index)
//        parentViewController?.addChild(childVC)
//        childVC.view.translatesAutoresizingMaskIntoConstraints = false
//
//        contentView.addSubview(childVC.view)
//        NSLayoutConstraint.activate([
//            childVC.view.topAnchor.constraint(equalTo: contentView.topAnchor),
//            childVC.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            childVC.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            childVC.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
//
//        childVC.didMove(toParent: parentViewController)
//    }
//
//    func createChildViewController(for index: Int) -> UIViewController {
//        let childVC: UIViewController
//        switch index {
//        case 0:
//            childVC = MenChildVC()
//        case 1:
//            childVC = SecondChildViewController()
//        case 2:
//            childVC = ThirdChildViewController()
//        default:
//            childVC = MenChildVC()
//        }
//        return childVC
//    }
}




