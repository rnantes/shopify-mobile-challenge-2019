//
//  ProductImageDetails.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-19.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import Foundation

struct ProductImageDetails: Codable {
    var id: Int
    var product_id: Int
    var position: Int
    var created_at: Date
    var updated_at: Date
    var alt: String?
    var width: Int
    var height: Int
    var src: String
    var variant_ids: [Int]
    var admin_graphql_api_id: String
}
