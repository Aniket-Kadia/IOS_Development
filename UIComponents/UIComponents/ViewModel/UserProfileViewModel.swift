//
//  UserProfileViewModel.swift
//  UIComponents
//
//  Created by Aniket Kadia on 07/07/23.
//

import Foundation
import Alamofire

class UserProfileViewModel {
    
    //MARK: - Variables
    var userData = Dynamic<[Profile]>(nil)
    var dataDeleteID = Dynamic<Int>(nil)
    var errorState = Dynamic<Bool>(true)
    
    //MARK: GET UserList
    func getResponse(page: String) {
        AF.request(ApiRequestType.getUserList(page).targetUrl,method: .get).response { [weak self] response in
            guard let self = self, let data = response.data else {
                return
            }
            guard let result: UserProfileModel = ApiRequestType.jsonDecode(data: data, type: UserProfileModel.self) else {
                return
            }
            self.userData.value = result.data
        }
    }
    
    //MARK: DELETE User
    func deleteUser(id: String) {
        AF.request(ApiRequestType.deleteUser(id).targetUrl, method: .delete).response { [weak self] response in
            guard let self = self, let statusCode = response.response?.statusCode else {
                return
            }
            switch statusCode {
            case 200...299: self.dataDeleteID.value = Int(id)
            case 400...499: self.errorState.value = true
            default: return
            }
        }
    }
}
