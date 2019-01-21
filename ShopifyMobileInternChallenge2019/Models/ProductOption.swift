//
//  ProductOption.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-19.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import Foundation

struct ProductOption: Codable {
    var id: Int
    var product_id: Int
    var name: String
    var position: Int
    var values: [String]
}
