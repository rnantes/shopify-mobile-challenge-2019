//
//  ProductFetcher.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-19.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import Foundation

enum ProductFetchError: Error {
    case mustHaveAtLeastOneID
}

struct ProductFetcher {
    let fetchDetails = FetchDetails()
    let urlHelper = URLHelper()

    func fetchProductsByCollectionID(collectionID: Int, callback: @escaping ([Product]) -> Void) {
        var collectsResult: [Collect]? = nil
        do {
            collectsResult = try CollectFetcher().fetchSerial(page: 1, collectionID: collectionID)
        } catch {
            return
        }
        guard let collects = collectsResult else {
            return
        }
        if collects.count == 0 {
            return
        }

        var productIDs = [Int]()
        for collect in collects {
            productIDs.append(collect.product_id)
        }

        self.fetch(page: 1, ids: productIDs, callback: callback)
    }


    func fetch(page: Int, ids: [Int], callback: @escaping ([Product]) -> Void) {
        if ids.count < 1 {
            return
        }
        let idStringArray = ids.map { String($0) }
        let idsString = idStringArray.joined(separator: ",")

        var urlResult: URL? = nil
        do {
            urlResult = try urlHelper.buildURLWithParams(baseUrlString: fetchDetails.baseURLString,
                                                         pathComponents: ["admin", "products.json"],
                                                         params: ["page":"\(page)",
                                                            "ids":"\(idsString)",
                                                            "access_token":"\(fetchDetails.accessToken)"])
        } catch {
            return
        }
        guard let url = urlResult else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                return
            }

            if response != nil {
                print(response!.expectedContentLength)
            }

            guard let jsonData = data else {
                return
            }

            let jsonDecoder = JSONDecoder.init()
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.init(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
            jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
            do {
                let productContainer = try jsonDecoder.decode(ProductContainer.self, from: jsonData)
                callback(productContainer.products)
            } catch {
                print(error)
                return
            }
        }
        task.resume()
    }

}
