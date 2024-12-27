//
//  HomeModel.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/8/24.
//

import UIKit

struct RootModel: Codable {
    let headers: HeadersModel
    let topPicks: [TopPickModel]
    let pageControl: [PageControlModel]
    let listModel: [ListModel]
    let productCategory1: ProductCategory1Model
    let alwaysPopular: [AlwaysPopularModel]
    let productCategory2: [TopPickModel]
    let thankYou: [ThankYouModel]
    let shoes: [Categories]
    let detailButtonsName: DetailButtonsModel
    let shopButtons: ShopButtonsModel
    let youMightAlsoLike: [ThankYouModel]
    let promotionModel: [PromotionModel]
}

struct ProductCategory1Model: Codable {
    let firstCollection: [TopPickModel]
    let secondCollection: [TopPickModel]
}

struct PageControlModel: Codable {
    let image: String
    let title: String
    let description: String
}

struct ListModel: Codable {
    let videoURL: String?
    let image: String?
}

struct AlwaysPopularModel: Codable {
    let largeImage: String
    let smallImage1: String
    let smallImage2: String
    
    let largeImageLabel1: String
    let largeImageLabel2: String
    
    let smallImage1Label1: String
    let smallImage1Label2: String
    let smallImage2Label1: String
    let smallImage2Label2: String
    
    let title: String
    let rightButtonTitle: String
    let bottomButtonTitle: String
}

struct ThankYouModel: Codable {
    let image: String
}

struct TopPickModel: Codable {
    let id: Int
    var count: Int
    let image: String
    let description: String
    let type: String
    let price: String
    let categories: [Categories]?
    let listCategories: [ListModel]?
    let categoryName: String?
    let detailButtonsName: DetailButtonsModel?
    let pagecontrolModel: [PageControlModel]?
    let youMightAlsoLike: [ThankYouModel]?
}

struct Categories: Codable {
    let image2: String
    let subCategories: [SubCategoryModel]
}

struct SubCategoryModel: Codable {
    let image3: String
    let currentSubCategory: String?
}

struct DetailButtonsModel: Codable {
    let firstButtonTitle: String
    let seconrButtonTitle: String
}

struct ShopButtonsModel: Codable {
    let firstButtonTitle: String
    let seconrButtonTitle: String
    let thirdButtonTitle: String
}

struct PromotionModel: Codable {
    let label: String?
}






