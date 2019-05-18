//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Seschwan on 5/17/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListCollectionViewController: UICollectionViewController {

    let shoppingItemController = ShoppingItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }


    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.itemNamesArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
        
        let items = shoppingItemController.itemNamesArray[indexPath.item]
        
        cell.shoppingItem = items
        cell.shoppingCellDelegate = self
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemController.itemNamesArray[indexPath.item]
        shoppingItemController.updateItem(item: shoppingItem)
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToOrderVC" {
            let destinationVC = segue.destination as! OrderViewController
            destinationVC.shoppingItemController = shoppingItemController
        }
    }

    
}

extension ShoppingListCollectionViewController: ShoppingItemCollectionViewCellDelegate {
    func addedBtntoggled(on cell: UICollectionViewCell) {
        guard let index = collectionView.indexPath(for: cell) else { return }
        let item = shoppingItemController.itemNamesArray[index.item]
        shoppingItemController.updateItem(item: item)
        print("Toggled Button")
        collectionView?.reloadItems(at: [index])
        
    }
    
    
    
}
