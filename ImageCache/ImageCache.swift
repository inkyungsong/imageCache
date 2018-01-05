//
//  ImageCache.swift
//  ImageCache
//
//  Created by KS23225 on 11/25/17.
//  Copyright © 2017 IKSong. All rights reserved.
//

import UIKit

class ImageCache {
    static private var cachedKeys = [String]()
    static let sharedCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.name = "ImageCache"
        cache.countLimit = 20
        cache.totalCostLimit = 10*1024*1024
        return cache
    }()
}

class ImageDownloader {
    static func downloadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let image = ImageCache.sharedCache.object(forKey: (urlString as NSString)) {
            print("fetched from cache ...")
            completion(image)
            return
        } else {
            guard let url = URL(string: urlString) else {
                completion(nil)
                return
            }
            
            WebService().loadImageFromURL(url) { result in
                switch result {
                case .success(let image):
                    completion(image)
                case .failure(let errorMessage):
                    print("fetch failed : \(errorMessage)")
                }
            }
        }
    }
}
