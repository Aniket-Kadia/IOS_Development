//
//  UploadImageViewModel.swift
//  UIComponents
//
//  Created by Aniket Kadia on 06/07/23.
//

import Foundation
import UIKit
import Alamofire

class UploadImageViewModel {
    
    //MARK: - Variables
    var imageUrl = Dynamic<String>(nil)
    var errorState = Dynamic<Bool>(true)
    
    //MARK: API Call
    func uploadImage(image: UIImage) {
        guard let imageData = image.pngData() else {
            return
        }
        AF.upload(imageData, to: UploadRequest.uploadImage.targetUrl, headers: HTTPHeaders(UploadRequest.uploadImage.httpHeaders)).responseData { [weak self] response in
            guard let self = self else { return }
            switch response.result {
            case .success(let data):
                guard let result = ApiRequestType.jsonDecode(data: data, type: UploadImageResponse.self) else {
                    return
                }
                self.imageUrl.value = result.fileURL
                
            case .failure(_):
                self.errorState.value = true
            }
        }
    }
}
