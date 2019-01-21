//
//  CollectionDetailsCardView.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-20.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import UIKit

class CollectionDetailsCardView: UIView {

    let imageView = UIImageView()
    let titleLabel = UILabel()
    let htmlBodyLabel = UILabel()

    override init (frame: CGRect) {
        super.init(frame: frame)
        buildUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildUI()
    }

    func update(image: UIImage?, title: String, htmlBody: String) {
        imageView.image = image
        titleLabel.text = title
        htmlBodyLabel.text = htmlBody
    }

    func buildUI() {

    }

}
