//
//  CustomCollection.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-19.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import Foundation

struct CustomCollection: Codable {
    var id: Int
    var handle: String
    var title: String
    var updated_at: Date
    var body_html: String
    var published_at: Date
    var sort_order: String
    var template_suffix: String?
    var published_scope: String
    var admin_graphql_api_id: String
    var image: ImageDetails
}
