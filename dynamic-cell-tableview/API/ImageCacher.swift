//
//  ImageCacher.swift
//  dynamic-cell-tableview
//
//  Created by Abhishek Ravi on 04/04/23.
//

import UIKit

class ImageCacher {
    
    // TODO: DI
    private let downloader = NetworkLayer()
    private let cache = NSCache<NSString, NSData>()
    
    static var shared = ImageCacher()
    
    init() {
        //TODO: Set Cache Eviction Policy
    }
    
    func getImage(_ url: URL, onCompletion: @escaping (_ image: UIImage?) -> Void) {
        if let imageData = cache.object(forKey: url.absoluteString as NSString) {
            print("📦 From Cache : \(url.absoluteString)")
            onCompletion(UIImage(data: imageData as Data))
            return
        }
        print("🟢 Image Download Started for \(url.absoluteString)")
        downloader.downloadImage(url) { [weak self] data in
            if let d = data {
                self?.cache.setObject(d as NSData, forKey: url.absoluteString as NSString)
                onCompletion(UIImage(data: d))
            } else {
                onCompletion(nil)
            }
        }
    }
    
}
