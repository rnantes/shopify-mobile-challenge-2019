//
//  CustomCollectionFetcher.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-19.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import Foundation

struct CustomCollectionFetcher {
    let fetchDetails = FetchDetails()
    let urlHelper = URLHelper()

    func fetch(page: Int, callback: @escaping ([CustomCollection]) -> Void) throws {
        var urlResult: URL? = nil
        do {
            urlResult = try urlHelper.buildURLWithParams(baseUrlString: fetchDetails.baseURLString,
                                         pathComponents: ["admin", "custom_collections.json"],
                                         params: ["page":"\(page)", "access_token":"\(fetchDetails.accessToken)"])
        } catch {
            throw error
        }
        guard let url = urlResult else {
            throw URLHelperError.couldNotCreateURL
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
                let customCollectionContainer = try jsonDecoder.decode(CustomCollectionContainer.self, from: jsonData)
                callback(customCollectionContainer.custom_collections)
            } catch {
                print(error)
                return
            }
        }
        task.resume()
    }

}
