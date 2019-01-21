//
//  ImageFetcher.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-20.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import Foundation
import UIKit

struct ImageFetcher {
    
    func fetch(src: String, callback: @escaping (String, UIImage) -> Void) {
        guard let url = URL.init(string: src) else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                return
            }

            if response != nil {
                print(response!.expectedContentLength)
            }

            guard let imageData = data else {
                return
            }

            if let image = UIImage.init(data: imageData) {
                callback(src, image)
            } else {
                return
            }
        }
        task.resume()
    }
}
