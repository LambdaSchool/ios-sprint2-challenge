//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Daniela Parra on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit


class ShoppingItemController {
    
    init() {
        let isInitiated = UserDefaults.standard.bool(forKey: .isInitiatedKey)
        if isInitiated {
            loadFromPersistentStore()
        } else {
            create()
        }
    }
    
    func create() {
        
        for name in itemNames {
            let shoppingItem = ShoppingItem(name: name, imageName: name)
            shoppingItems.append(shoppingItem)
        }
        UserDefaults.standard.set(true, forKey: .isInitiatedKey)
        saveToPersistentStore()
    }
    
//    func createNewItem(name: String, image: UIImage) {
//        let image =
//    }
    
    func update(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        
        var scratch = shoppingItem
        scratch.isAdded = !shoppingItem.isAdded
        
        shoppingItems.remove(at: index)
        shoppingItems.insert(scratch, at: index)
        
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        let plistEncoder = PropertyListEncoder()
        
        do {
            let shoppingItemsData = try plistEncoder.encode(shoppingItems)
            guard let shoppingItemsFileURL = shoppingItemsFileURL else { return }
            try shoppingItemsData.write(to: shoppingItemsFileURL)
        } catch {
            NSLog("Error enconding shopping items: \(error)")
        }
        
    }
    
    func loadFromPersistentStore() {
        
        do {
            guard let shoppingItemsFileURL = shoppingItemsFileURL,
                FileManager.default.fileExists(atPath: shoppingItemsFileURL.path) else  { return }
            
            let shoppingListData = try Data(contentsOf: shoppingItemsFileURL)
            
            let plistDecoder = PropertyListDecoder()
            self.shoppingItems = try plistDecoder.decode([ShoppingItem].self, from: shoppingListData)
            
        } catch {
            NSLog("Error decoding shopping items: \(error)")
        }
    }
    
    var shoppingItemsFileURL: URL? {
        
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let fileName = "shoppingItems.plist"
        
        return documentDirectory?.appendingPathComponent(fileName)
    }
    
    var shoppingItems: [ShoppingItem] = []
    
    private let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
}
