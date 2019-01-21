//
//  CollectionDetailsTableViewController.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-19.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import UIKit

protocol CollectionDetailsTableViewControllerDelegate {
    
}

class CollectionDetailsTableViewController: UITableViewController {
    // delegate
    var delegate: CollectionDetailsTableViewControllerDelegate?

    // properties
    var selectedCustomCollection: CustomCollection?
    var selectedCustomCollectionImage: UIImage?
    var collects = [Collect]()
    var products = [Product]()

    var collectionImage: UIImage?
    var imageCache = [String: UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(CollectionDetailsTableViewCell.self, forCellReuseIdentifier: "CollectionDetailsTableViewCell")
    }

    // MARK: - Table view data sources

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionDetailsTableViewCell", for: indexPath) as! CollectionDetailsTableViewCell

        let product = products[indexPath.row]

        var collectionTitle = "Unknown"
        if selectedCustomCollection != nil {
            collectionTitle = selectedCustomCollection!.title
        }

        cell.update(productName: product.title,
                    inventoryQuantityAcrossVariants: product.calculateTotalInvetoryQuantityAcrossVariants(),
                    collectionTitle: collectionTitle,
                    collectionImage: selectedCustomCollectionImage)

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    func fetchCollects(collectionID: Int) {
        guard let collectionID = selectedCustomCollection?.id else {
            // collection not selected
            return
        }

        DispatchQueue.global(qos: .userInitiated).async {
            ProductFetcher().fetchProductsByCollectionID(collectionID: collectionID, callback: self.productsWereFetched)
        }
    }
    

    func productsWereFetched(products: [Product]) {
        DispatchQueue.main.async {
            self.products = products
            self.tableView.reloadData()
        }
    }

    func fetchCollectionImage(customCollection: CustomCollection) {
        DispatchQueue.global(qos: .userInitiated).async {
            ImageFetcher().fetch(src: customCollection.image.src, callback: self.collectionImageWasFetched)
        }
    }

    func collectionImageWasFetched(src: String, image: UIImage) {
        DispatchQueue.main.async {
            self.selectedCustomCollectionImage = image
        }
    }

    func update(selectedCustomCollection: CustomCollection) {
        self.selectedCustomCollection = selectedCustomCollection
        self.title = selectedCustomCollection.title
        self.collects = []
        self.products = []

        fetchCollects(collectionID: selectedCustomCollection.id)
        fetchCollectionImage(customCollection: selectedCustomCollection)

        self.tableView.reloadData()
    }

    func update(collectionID: Int) {
        fetchCollects(collectionID: collectionID)
    }

}
