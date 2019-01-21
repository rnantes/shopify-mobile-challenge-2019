//
//  ImageDetails.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-19.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import Foundation

struct ImageDetails: Codable {
    var created_at: Date
    var alt: String?
    var width: Int
    var height: Int
    var src: String
}
