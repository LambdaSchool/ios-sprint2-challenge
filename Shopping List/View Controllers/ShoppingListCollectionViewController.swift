//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Eoin Lavery on 19/08/2019.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {

    var shoppingListController = ShoppingList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PlaceOrderShowSegue" {
            guard let placeOrderVC = segue.destination as? PlaceOrderViewController else { return }
            
            for item in shoppingListController.shoppingList {
                if item.isListed == true {
                    placeOrderVC.basket.append(item)
                }
            }
        }
    }

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
    
        cell.shoppingItem = shoppingListController.shoppingList[indexPath.item]
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let tappedItem = shoppingListController.shoppingList[indexPath.item]
        shoppingListController.shoppingItemToggle(for: tappedItem)
        collectionView.reloadData()
        return false
    }
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
