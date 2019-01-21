//
//  CollectionDetailsTableViewCell.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-19.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import UIKit

class CollectionDetailsTableViewCell: UITableViewCell {

    // UI
    let collectionImageView = UIImageView()

    let textContainerView = UIView()

    let productNameLabel = UILabel()
    let quantityLabel = UILabel()
    let collectionTitleLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func update(productName: String, inventoryQuantityAcrossVariants: Int, collectionTitle: String, collectionImage: UIImage?) {
        self.productNameLabel.text = productName
        self.quantityLabel.text = "Available Inventory: \(inventoryQuantityAcrossVariants)"
        self.collectionTitleLabel.text = "Collection: \(collectionTitle)"
        self.collectionImageView.image = collectionImage
    }

    func buildUI() {
        let contentView = self.contentView

        // collectionImageView
        contentView.addSubview(collectionImageView)
        collectionImageView.backgroundColor = UIColor.init(red: 245, green: 245, blue: 245, alpha: 1.0)
        collectionImageView.translatesAutoresizingMaskIntoConstraints = false

        collectionImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        collectionImageView.heightAnchor.constraint(equalToConstant: 84).isActive = true
        collectionImageView.widthAnchor.constraint(equalTo: collectionImageView.heightAnchor).isActive = true
        collectionImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true


        // textContainerView
        contentView.addSubview(textContainerView)
        textContainerView.translatesAutoresizingMaskIntoConstraints = false
        textContainerView.leadingAnchor.constraint(equalTo: collectionImageView.trailingAnchor, constant: 16).isActive = true
        textContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        textContainerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        // productNameLabel
        productNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textContainerView.addSubview(productNameLabel)
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false

        productNameLabel.leadingAnchor.constraint(equalTo: textContainerView.leadingAnchor).isActive = true
        productNameLabel.trailingAnchor.constraint(equalTo: textContainerView.trailingAnchor).isActive = true
        productNameLabel.topAnchor.constraint(equalTo: textContainerView.topAnchor).isActive = true

        // quantityLabel
        quantityLabel.textColor = UIColor.gray
        quantityLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        textContainerView.addSubview(quantityLabel)
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false

        quantityLabel.leadingAnchor.constraint(equalTo: textContainerView.leadingAnchor).isActive = true
        quantityLabel.trailingAnchor.constraint(equalTo: textContainerView.trailingAnchor).isActive = true
        quantityLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 4).isActive = true

        // collectionTitleLabel
        collectionTitleLabel.textColor = UIColor.gray
        collectionTitleLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        textContainerView.addSubview(collectionTitleLabel)
        collectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false

        collectionTitleLabel.leadingAnchor.constraint(equalTo: textContainerView.leadingAnchor).isActive = true
        collectionTitleLabel.trailingAnchor.constraint(equalTo: textContainerView.trailingAnchor).isActive = true
        collectionTitleLabel.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 4).isActive = true

        // set textContainerView to contain childviews
        textContainerView.bottomAnchor.constraint(equalTo: collectionTitleLabel.bottomAnchor).isActive = true
    }

}
