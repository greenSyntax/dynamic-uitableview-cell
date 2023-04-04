//
//  PostModel.swift
//  dynamic-cell-tableview
//
//  Created by Abhishek Ravi on 04/04/23.
//

import Foundation

struct PostModel: Codable {
    let header: Header
    let thumbnail: Thumbnail
    let content: [String]
    let footer: Footer
}

struct Footer: Codable {
    let published: String
    let link: String
}

struct Header: Codable {
    let title, description, author, timestamp: String
}

struct Thumbnail: Codable {
    let imagePath: String
}
