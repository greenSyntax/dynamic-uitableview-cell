//
//  APIEndpoint.swift
//  dynamic-cell-tableview
//
//  Created by Abhishek Ravi on 04/04/23.
//

import Foundation

enum APIEndpoint {
    case post
    
    var apiPath: URL {
        switch self {
        case .post:
            return URL(string: "https://mocki.io/v1/24bef64c-6e27-460f-810e-8f2eaedaa5f2")!
        }
    }
}
