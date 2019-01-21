//
//  Product.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-19.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import Foundation

struct Product: Codable {
    var id: Int
    var title: String
    var body_html: String
    var vendor: String
    var product_type: String
    var created_at: Date
    var handle: String
    var updated_at: Date
    var published_at: Date
    var template_suffix: String?
    var tags: String
    var published_scope: String
    var admin_graphql_api_id: String

    var variants: [ProductVariant]
    var options: [ProductOption]
    var images: [ProductImageDetails]
    var image: ProductImageDetails?

    func calculateTotalInvetoryQuantityAcrossVariants() -> Int {
        var totalInvetoryQuantityAcrossVariants = 0
        for variant in variants {
            totalInvetoryQuantityAcrossVariants += variant.inventory_quantity
        }

        return totalInvetoryQuantityAcrossVariants
    }
}
