//
//  UserProfileModel.swift
//  UIComponents
//
//  Created by Aniket Kadia on 05/07/23.
//

import Foundation

// MARK: - UserProfileModel
struct UserProfileModel: Codable {
    let page, perPage, total, totalPages: Int
    let data: [Profile]

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
    }
}

// MARK: - Profile
struct Profile: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
