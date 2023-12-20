//
//  LoginSignupModel.swift
//  UIComponents
//
//  Created by Aniket Kadia on 19/07/23.
//

import Foundation

//MARK: - AccessToken
struct AccessToken: Decodable {
    var token: String
}

//MARK: - RegisterAccount
struct RegisterAccount: Decodable {
    var id: Int
    var token: String
}
