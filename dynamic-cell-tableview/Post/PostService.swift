//
//  UserProfileService.swift
//  dynamic-cell-tableview
//
//  Created by Abhishek Ravi on 04/04/23.
//

import Foundation

class PostService {
 
    // TODO: Use DI
    let apiClient = NetworkLayer()
    
    func getDataFromPostAPI(onCompletion: @escaping (_ result: Result<PostModel, Error>) -> Void) {
        apiClient.request(APIEndpoint.post.apiPath) { (_ result: Result<PostModel, Error>)  in
            switch result {
            case .failure(let error):
                onCompletion(.failure(error))
            case .success(let postModel):
                onCompletion(.success(postModel))
            }
        }
    }
}
