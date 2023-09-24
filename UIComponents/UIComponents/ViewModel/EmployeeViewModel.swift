//
//  EmployeeViewModel.swift
//  UIComponents
//
//  Created by Aniket Kadia on 07/07/23.
//

import Foundation
import Alamofire

class EmployeeViewModel {
    
    //MARK: - Variables
    var employeeDetail = Dynamic<Employee>(nil)
    var errorState = Dynamic<Bool>(true)
    
    //MARK: API Call
    func getResponse(employeeID: String) {
        let apiManager = ApiManager()
        apiManager.getApiResponse(requestPayload: nil, requestType: ApiRequestType.getUser(employeeID)) { [weak self] (result: Result<BaseResponse, Error>, code) in
            guard let code = code, let self = self else {
                return
            }
            switch result {
            case .success(let success):
                switch (code.statusCode) {
                case 200...299:
                    guard let employeeDetail = success.data else { return }
                    self.employeeDetail.value = employeeDetail
                case 400...499: self.errorState.value = true
                default:
                    return
                }
            case .failure(let failure):
                debugPrint(failure)
            }
        }
    }
}
