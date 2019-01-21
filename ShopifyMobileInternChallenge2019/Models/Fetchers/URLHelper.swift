//
//  URLHelper.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-19.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import Foundation

enum URLHelperError: Error {
    case couldNotCreateURL
}

struct URLHelper {

    func buildURLWithParams(baseUrlString: String, pathComponents: [String], params: [String: String]) throws -> URL {
        guard var url = URL.init(string: baseUrlString) else {
            throw URLHelperError.couldNotCreateURL
        }

        // add path components
        for pathComponent in pathComponents {
            url = url.appendingPathComponent(pathComponent)
        }

        guard var urlComponents = URLComponents.init(url: url, resolvingAgainstBaseURL: true) else {
            throw URLHelperError.couldNotCreateURL
        }

        // add queryItems (params)
        var queryItems = [URLQueryItem]()
        for param in params {
            queryItems.append(URLQueryItem.init(name: param.key, value: param.value))
        }
        urlComponents.queryItems = queryItems

        guard let urlWithParams = urlComponents.url else {
            throw URLHelperError.couldNotCreateURL
        }

        return urlWithParams
    }

}
