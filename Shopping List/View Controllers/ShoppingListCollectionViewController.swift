//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by Breena Greek on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

//protocol IsSelectedDelegate {
//    func isSelectedArray(_ shoppingItem: ShoppingItem)
//}

private let reuseIdentifier = "ShoppingItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: UICollectionViewDataSource
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        
        let shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        cell.shoppingItem = shoppingItem
        cell.shoppingItemController = shoppingItemController
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ShoppingItemCollectionViewCell else { return }
        
        let shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        shoppingItemController.toggleItemSelected(shoppingItem: shoppingItem)
        cell.shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        if let index = shoppingItemController.itemSelectedAdd.firstIndex(of: shoppingItem) {
            shoppingItemController.itemSelectedAdd.remove(at: index)
            
        } else {
            shoppingItemController.itemSelectedAdd.append(shoppingItem)

        }
        for item in shoppingItemController.itemSelectedAdd {
            print(item.name)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShoppingListDetailSegue" {
            let addItemVC = segue.destination as! AddItemViewController
            addItemVC.shoppingItemController = shoppingItemController
            
            
        }
    }
}
