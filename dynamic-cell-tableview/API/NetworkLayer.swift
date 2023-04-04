//
//  NetworkLayer.swift
//  dynamic-cell-tableview
//
//  Created by Abhishek Ravi on 04/04/23.
//

import Foundation

class NetworkLayer {
    
    func request<T: Codable>(_ url: URL, onCompletion: @escaping (_ result: Result<T, Error>) -> Void) {
        print("🌎 Network Request for \(url.absoluteString) ")
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            DispatchQueue.main.async {
                // onFailure
                if let err = error {
                    onCompletion(.failure(err))
                    return
                }
                
                // onSuccess
                if let d = data,
                   let responseData = try? JSONDecoder().decode(T.self, from: d) {
                    onCompletion(.success(responseData))
                }
            }
        }.resume()
    }
    
    func downloadImage(_ url: URL, onCompletion: @escaping (_ data: Data?) -> Void) {
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            DispatchQueue.main.async {
                if let err = error {
                    print("Network Error while downloading Image: \(err.localizedDescription)")
                    onCompletion(nil)
                    return
                }
                onCompletion(data)
            }
        }.resume()
    }
    
}
