//
//  HeadersModels.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/2/24.
//

import Foundation

struct HeadersModel: Codable {
    let topPicksHeaderModel: UniversalHeaderModel
    let titleHeaderModel: TitleHeaderModel
    let thisWeekHeader: ThisWeekHeader
    let listHeader: ListHeaderModel
    let productCategory1Header: UniversalHeaderModel
    let productCategory2Header: UniversalHeaderModel
}

struct UniversalHeaderModel: Codable {
    let firstLabelText: String
    let subtitleLabel: String
    let buttonTitle: String
}

struct TitleHeaderModel: Codable {
    let title: String
    let subtitleLabel: String
    let buttonTitle: String
}

struct ThisWeekHeader: Codable {
    let firstLabelText: String
}

struct ListHeaderModel: Codable {
    var labelText: String?
    var buttonTitle: String?
}
