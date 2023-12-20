//
//  EmployeeModel.swift
//  UIComponents
//
//  Created by Aniket Kadia on 03/07/23.
//

import Foundation

struct BaseResponse: Decodable {
    var data: Employee?
}

struct Employee: Decodable {
    let id: Int?
    let email: String?
    let first_name: String?
    let last_name: String?
    let avatar: String?
}
