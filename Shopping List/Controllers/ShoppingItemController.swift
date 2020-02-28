//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Karen Rodriguez on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController: Codable {
    var items: [ShoppingItem] = []
    
    var addedItems: [ShoppingItem] {
        get {
            let added: [ShoppingItem] = items.filter{item in item.isAdded}
            return added
        }
    }
    
    var shoppingListURL: URL? {
        get {
            let fileManager = FileManager.default
            guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
            let plistFile = documentsDir.appendingPathComponent("ShoppingList.plist")
            
            return plistFile
    } }
    
    
    // MARK: - PropertyListEncoder
    
    func saveToPersistentStore() {
        
        guard let fileUrl = shoppingListURL else { return }
        let propertyList = PropertyListEncoder()
        
        do {
            let itemsData = try propertyList.encode(items)
            try itemsData.write(to: fileUrl)
        } catch {
            print("Error encoding Item: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let fileUrl = shoppingListURL else { return }
        do {
            let data = try Data(contentsOf: fileUrl)
            let plistDecoder = PropertyListDecoder()
            let decodedItems = try plistDecoder.decode([ShoppingItem].self , from: data)
            items = decodedItems
            
        } catch {
            print("Failed to load decoded items array: \(error)")
        }
    }
    
    
}
