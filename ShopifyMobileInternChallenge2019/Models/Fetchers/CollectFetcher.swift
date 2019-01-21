//
//  CollectFetcher.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-19.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import Foundation

struct CollectFetcher {
    private let fetchDetails = FetchDetails()
    private let urlHelper = URLHelper()

    private var semaphore = DispatchSemaphore(value: 0)

    func fetchSerial(page: Int, collectionID: Int) throws -> [Collect] {
        var collects: [Collect]? = nil
        
        var urlResult: URL? = nil
        do {
            urlResult = try urlHelper.buildURLWithParams(baseUrlString: fetchDetails.baseURLString,
                                                         pathComponents: ["admin", "collects.json"],
                                                         params: ["page":"\(page)",
                                                            "collection_id":"\(collectionID)",
                                                            "access_token":"\(fetchDetails.accessToken)"])
        } catch {
            throw error
        }
        guard let url = urlResult else {
            throw URLHelperError.couldNotCreateURL
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                self.semaphore.signal()
                return
            }

            if response != nil {
                print(response!.expectedContentLength)
            }

            guard let jsonData = data else {
                self.semaphore.signal()
                return
            }

            let jsonDecoder = JSONDecoder.init()
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.init(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
            jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
            do {
                let collectContainer = try jsonDecoder.decode(CollectContainer.self, from: jsonData)

                collects = collectContainer.collects
                self.semaphore.signal()
            } catch {
                print(error)
                self.semaphore.signal()
                return
            }
        }
        task.resume()
        semaphore.wait()

        if let collects = collects {
            return collects
        } else {
            throw URLHelperError.couldNotCreateURL
        }
    }

}
