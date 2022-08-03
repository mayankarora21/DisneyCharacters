//
//  UIImageViewExtension.swift
//  DisneyCharacters
//
//  Created by user224841 on 8/2/22.
//

import Foundation
import UIKit

extension UIImageView {
//    func setImage(url: URL, placeholder: UIImage?, cache: URLCache? = nil) {
////        guard let imageURL = URL(string: url) else { return }
//
//            // just not to cause a deadlock in UI!
//        DispatchQueue.global().async {
//            guard let imageData = try? Data(contentsOf: url) else { return }
//
//            let image = UIImage(data: imageData)
//            DispatchQueue.main.async {
//                self.image = image
//            }
//        }
//    }
    
//    set image using cache
    func setImage(url: URL, placeholder: UIImage?, cache: URLCache? = nil) {
            let cache = cache ?? URLCache.shared
            let request = URLRequest(url: url)
            if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            } else {
                self.image = placeholder
                URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                    if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
                        let cachedData = CachedURLResponse(response: response, data: data)
                        cache.storeCachedResponse(cachedData, for: request)
                        DispatchQueue.main.async {
                            self.image = image
                        }

                    }
                }).resume()
            }
        }
}
