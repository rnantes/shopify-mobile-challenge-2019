//
//  ProductVariants.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-19.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import Foundation

struct ProductVariant: Codable {
    var id: Int
    var product_id: Int
    var title: String
    var price: String
    var sku: String
    var position: Int
    var inventory_policy: String
    var compare_at_price: String?
    var fulfillment_service: String
    var inventory_management: String?
    var option1: String?
    var option2: String?
    var option3: String?
    var created_at: Date
    var updated_at: Date
    var taxable: Bool
    var barcode: String?
    var grams: Int
    var image_id: String?
    var weight: Double
    var weight_unit: String
    var inventory_item_id: Int
    var inventory_quantity: Int
    var old_inventory_quantity: Int
    var requires_shipping: Bool
    var admin_graphql_api_id: String
}
