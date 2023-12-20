//
//  NetworkManager.swift
//  UIComponents
//
//  Created by Aniket Kadia on 03/07/23.
//

import Foundation

class ApiManager {
    func getApiResponse<T: Decodable>(requestPayload: Data?, requestType: ApiRequestType, completionHandler: @escaping (Result<T, Error>, _ responseCode: HTTPURLResponse?) -> ()) {
        
        guard let targetUrl = URL(string: requestType.targetUrl) else {
            print("There is error in URL.")
            return
        }
        var urlRequest = URLRequest(url: targetUrl, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        urlRequest.httpMethod = requestType.httpMethods.rawValue
        urlRequest.allHTTPHeaderFields = requestType.httpHeaders
        if requestPayload != nil {
            urlRequest.httpBody = requestPayload
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            if let error {
                print("Error: \(error.localizedDescription)")
            }
            guard let data else {
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                let response = try jsonDecoder.decode(T.self, from: data)
                completionHandler(.success(response),urlResponse as? HTTPURLResponse)
            } catch {
                completionHandler(.failure(error), urlResponse as? HTTPURLResponse)
            }
        }.resume()
    }
}
