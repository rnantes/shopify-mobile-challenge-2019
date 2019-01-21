//
//  RootNavigationController.swift
//  ShopifyMobileInternChallenge2019
//
//  Created by Reid Nantes on 2019-01-19.
//  Copyright © 2019 Reid Nantes. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController, CustomCollectionsTableViewControllerDelegate,  CollectionDetailsTableViewControllerDelegate {

    // child view controllers
    let customCollectionsTableViewController = CustomCollectionsTableViewController()

    let collectionDetailsTableViewController = CollectionDetailsTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // set delacates
        customCollectionsTableViewController.delegate = self
        collectionDetailsTableViewController.delegate = self


        self.pushViewController(customCollectionsTableViewController, animated: false)
    }

    // customCollectionsTableViewController delegate functions
    func CustomCollectionSelected(_ customCollection: CustomCollection) {
        collectionDetailsTableViewController.update(selectedCustomCollection: customCollection)
        self.pushViewController(collectionDetailsTableViewController, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
