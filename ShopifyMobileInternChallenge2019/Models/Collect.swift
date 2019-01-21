//
//  Collect.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-19.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import Foundation

struct Collect: Codable {
    var id: Int
    var collection_id: Int
    var product_id: Int
    var featured: Bool
    var created_at: Date
    var updated_at: Date
    var position: Int
    var sort_value: String
}
