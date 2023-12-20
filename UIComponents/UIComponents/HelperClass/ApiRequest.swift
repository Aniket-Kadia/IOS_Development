//
//  ApiClient.swift
//  UIComponents
//
//  Created by Aniket Kadia on 03/07/23.
//

import Foundation

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

enum ApiRequestType {
    case getUser(String)
    case getUserList(String)
    case deleteUser(String)
    case registerUser
    case loginUser
}

extension ApiRequestType {
    var baseUrl: String{
        return "https://reqres.in/api/"
    }
    
    var httpMethods: RequestMethod {
        switch self {
        case .getUser(_): return RequestMethod.get
        case .getUserList(_): return RequestMethod.get
        case .deleteUser(_): return RequestMethod.delete
        case .registerUser: return RequestMethod.post
        case .loginUser: return RequestMethod.post
        }
    }
    
    var httpHeaders: [String : String] {
        return ["Content-Type": "application/json", "Accept" : "application/json"]
    }
    
    var path: String {
        switch self {
        case .getUser(let id): return "users/\(id)"
        case .getUserList(let page): return "users?page=\(page)"
        case .deleteUser(let id): return "users/\(id)"
        case .registerUser: return "register"
        case .loginUser: return "login"
        }
    }
    
    var targetUrl: String {
        return baseUrl + path
    }
    
    static func jsonDecode<T: Decodable> (data: Data, type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            return try jsonDecoder.decode(type.self, from: data)
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
