//
//  LoginSignupViewModel.swift
//  UIComponents
//
//  Created by Aniket Kadia on 04/07/23.
//

import Foundation
import Alamofire

class LoginViewModel {
    
    //MARK: - Variables
    let isSuccess = Dynamic<String>(nil)
    let isUnuccess = Dynamic<Int>(nil)
    let fieldState = Dynamic<LoginSignupFields>(nil)
    let indicatorState = Dynamic<Bool>(nil)
    
    //MARK: API Call
    func authenticate(username: String?, password: String?) {
        guard let username, let password else { return }
        if (username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
            fieldState.value = LoginSignupFields.email
        } else if (password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
            fieldState.value = LoginSignupFields.passwod
        } else {
            indicatorState.value = false
            let parameter = [LoginSignupFields.email.rawValue: username, LoginSignupFields.passwod.rawValue:password]
            AF.request(ApiRequestType.loginUser.targetUrl, method: .post, parameters: parameter).response { [weak self] response in
                guard let self = self, let statusCode = response.response?.statusCode else { return }
                
                switch statusCode {
                case 200: guard let data = response.data else { return }
                    guard let ans: AccessToken = ApiRequestType.jsonDecode(data: data, type: AccessToken.self) else {
                        self.indicatorState.value = true
                        return
                    }
                    self.isSuccess.value = ans.token
                    
                default: self.isUnuccess.value = statusCode
                }
                self.indicatorState.value = true
            }
        }
    }
}