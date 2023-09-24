//
//  UploadImageResponse.swift
//  UIComponents
//
//  Created by Aniket Kadia on 06/07/23.
//

import Foundation

// MARK: - UploadImageResponse
struct UploadImageResponse: Codable {
    let accountID, filePath: String
    let fileURL: String
    
    enum CodingKeys: String, CodingKey {
        case accountID = "accountId"
        case filePath
        case fileURL = "fileUrl"
    }
}
