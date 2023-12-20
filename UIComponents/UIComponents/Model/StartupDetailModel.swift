//
//  StartupDetailModel.swift
//  UIComponents
//
//  Created by Aniket Kadia on 07/07/23.
//

import Foundation

// MARK: - StartupDetailModel
struct StartupDetailModel: Codable {
    let title: String
    let total: Int
    let records: [Record]

    enum CodingKeys: String, CodingKey {
        case title
        case total
        case records
    }
}

// MARK: - Record
struct Record: Codable {
    let incubationCenter, nameOfTheStartup, locationOfCompany, sector: String
    let companyProfile: String

    enum CodingKeys: String, CodingKey {
        case incubationCenter = "incubation_center"
        case nameOfTheStartup = "name_of_the_startup"
        case locationOfCompany = "location_of_company"
        case sector
        case companyProfile = "company_profile"
    }
}
