//
//  GovermentApiRequest.swift
//  UIComponents
//
//  Created by Aniket Kadia on 17/07/23.
//

import Foundation
enum GovermentApiRequest {
    case getData(String, String)
}

extension GovermentApiRequest {
    var baseUrl: String{
        return "https://api.data.gov.in/resource/edd25cbd-ebf2-4658-b052-34a1b4cdc4f2?"
    }
    
    var httpHeaders: [String : String] {
        return ["Content-Type": "application/json", "Accept" : "application/json"]
    }
    
    var path: String {
        switch self {
        case .getData(let limit, let offset): return "api-key=579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b&format=json&limit=\(limit)&offset=\(offset)"
        }
    }
    
    var targetUrl: String {
        return baseUrl + path
    }
}
