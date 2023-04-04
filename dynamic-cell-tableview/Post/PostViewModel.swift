//
//  UserProfileViewModel.swift
//  dynamic-cell-tableview
//
//  Created by Abhishek Ravi on 04/04/23.
//

import Foundation

struct HeaderCellData {
    var title: String
    var descrption: String
    var author: String
    var timestamp: String
}

struct ThumbnailCellData {
    var thumbnailImage: String
}

struct ContentCellData {
    var contentText: String
}

struct FooterCellData {
    var link: String
}


enum PostType {
    case header(HeaderCellData)
    case thumbnail(ThumbnailCellData)
    case content(ContentCellData)
    case footer(FooterCellData)
}

class PostViewModel {
    
    // TODO: Use DI
    private var service: PostService = PostService()
    private var dataSource: [PostType]?
    
    var onSuccessHandler: ((_ canLoadUI: Bool) -> Void)?
    var onFailureHanlder: ((_ error: Error) -> Void)?
    
    func getData() {
        service.getDataFromPostAPI { result in
            switch result {
            case .success(let model):
                self.prepareDataSource(model)
                self.onSuccessHandler?(true)
            case .failure(let err):
                self.onFailureHanlder?(err)
            }
        }
    }
    
    func getPostDataAt(_ index: Int) -> PostType? {
        return self.dataSource?[index]
    }
    
    func getNumberOfRows() -> Int {
        return self.dataSource?.count ?? 0
    }
    
    private func prepareDataSource(_ model: PostModel) {
        self.dataSource?.removeAll()
        self.dataSource = []
        
        // Header Data
        self.dataSource?.append(PostType.header(HeaderCellData(title: model.header.title, descrption: model.header.description, author: model.header.author, timestamp: model.header.timestamp)))
        
        // Thumbnail
        self.dataSource?.append(PostType.thumbnail(ThumbnailCellData(thumbnailImage: model.thumbnail.imagePath)))
        
        // Content Text
        let contentData = model.content.map { contentText in
            return ContentCellData(contentText: contentText)
        }
        
        contentData.forEach { cellData in
            self.dataSource?.append(PostType.content(cellData))
        }
        
        // Footer
        self.dataSource?.append(PostType.footer(FooterCellData(link: model.footer.link)))
        
    }
    
}
