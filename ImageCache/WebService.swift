//
//  WebService.swift
//  ImageCache
//
//  Created by KS23225 on 11/25/17.
//  Copyright © 2017 IKSong. All rights reserved.
//

import UIKit

enum Result<T> {
    case success(T)
    case failure(String)
}

class WebService {
    
    func loadImageFromURL(_ url: URL, completion: @escaping (Result<UIImage>) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) in
            guard let data = data, let image = UIImage.init(data: data), error == nil else {
                completion(.failure("Invalid data response"))
                return
            }
            
            print("downloading image from the server ....")
            ImageCache.sharedCache.setObject(image, forKey: (url.absoluteString as NSString))
            DispatchQueue.main.async {
                completion(.success(image))
            }
        }).resume()
    }
    
}
