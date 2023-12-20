//
//  UploadRequestType.swift
//  UIComponents
//
//  Created by Aniket Kadia on 17/07/23.
//

import Foundation
enum UploadRequest {
    case uploadImage
}

extension UploadRequest {
    var baseUrl: String {
        return "https://api.upload.io/v2/accounts/12a1ySR/"
    }
    
    var httpMethods: String {
        switch self {
        case .uploadImage: return "POST"
        }
    }
    
    var httpHeaders: [String : String] {
        return ["Authorization" : "Bearer public_12a1ySR9E7TqimbTACHYVebtR6gE", "Content-Type" : "image/png"]
    }
    
    var path: String {
        switch self {
        case .uploadImage: return "uploads/binary"
        }
    }
    
    var targetUrl: String {
        return baseUrl + path
    }
}
