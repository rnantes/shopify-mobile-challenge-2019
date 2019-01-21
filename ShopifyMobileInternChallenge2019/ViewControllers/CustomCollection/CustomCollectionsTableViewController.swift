//
//  CustomCollectionsTableViewController.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-19.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import UIKit

protocol CustomCollectionsTableViewControllerDelegate {
    func CustomCollectionSelected(_ customCollection: CustomCollection)
}

class CustomCollectionsTableViewController: UITableViewController {
    // delegate
    var delegate: CustomCollectionsTableViewControllerDelegate?

    // properties
    var customCollections = [CustomCollection]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Custom Collections"

        tableView.register(CustomCollectionsTableViewCell.self, forCellReuseIdentifier: "CustomCollectionsTableViewCell")

        fetchCustomCollections()
    }

    func fetchCustomCollections() {
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try CustomCollectionFetcher().fetch(page: 1, callback: self.customCollectionsWasFetched)
            } catch {
                print("ERROR: could not fetch CustomCollection")
            }
        }
    }

    func customCollectionsWasFetched(customCollections: [CustomCollection]) {
        DispatchQueue.main.async {
            self.update(customCollections: customCollections)
        }
    }

    func update(customCollections: [CustomCollection]) {
        self.customCollections = customCollections
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return customCollections.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCollectionsTableViewCell", for: indexPath) as! CustomCollectionsTableViewCell

        cell.update(title: customCollections[indexPath.row].title)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.CustomCollectionSelected(customCollections[indexPath.row])
        }
    }


}
