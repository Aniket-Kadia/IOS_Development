//
//  StartupViewModel.swift
//  UIComponents
//
//  Created by Aniket Kadia on 18/07/23.
//

import Foundation
import Alamofire

class StartupViewModel {
    
    //MARK: - Variables
    var startupList =  Dynamic<StartupDetailModel>(nil)
    
    //MARK: API Call
    func getStartupList(offset: Int) {
        AF.request(GovermentApiRequest.getData("5", String(offset)).targetUrl,method: .get).response { [weak self] response in
            guard let self = self, let data = response.data else {
                return
            }
            guard let result: StartupDetailModel = ApiRequestType.jsonDecode(data: data, type: StartupDetailModel.self) else {
                return
            }
            self.startupList.value = result
        }
    }
}
