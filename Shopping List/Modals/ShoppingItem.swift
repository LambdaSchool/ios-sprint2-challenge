//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_167 on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

// MARK: - Private Functions


    func loadFromPersistentStore() {
    let fm = FileManager.default
    guard let url = shoppingListURL else {return}
    fm.fileExists(atPath: url.path)
    
    do {
        let decoder = PropertyListDecoder()
        let data = try Data(contentsOf: url)
        shoppinglistItems = try decoder.decode([shoppingItem].self, from: data)
    } catch {
        print("Error loading List data: \(error)")
    }
}
private func saveToPersistentStore() {
    guard let url = shoppingListURL else { return }
    do {
        let encoder = PropertyListEncoder()
        let data = try encoder.encode(shoppinglistItems)
        try data.write(to: url)
    } catch {
        NSLog("Error saving Shopping List Data: \(error)")
    }
//            private func saveToPersistentStore() {
//                let plistEncoder = PropertyListEncoder()
//                do {
//                let shoppingListData = try plistEncoder.encode(shoppingItem.init(nameOfShoppingItems: ["Apples", "Grapes", "Milk", "Muffin", "Popcorn", "Soda",  "Strawberries"], addedShoppingItems: false))
//                guard let fileURL = shoppingListURL else { return }
//
//                    try shoppingListData.write(to: fileURL)
//                } catch {
//                    NSLog("Error encoding items to property list: \(error)")
//    }
}
//  MARK: - Properties

private var shoppingListURL: URL? {
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    
    let fileName = "ShoppingList.plist"
    
    return documentDirectory?.appendingPathComponent(fileName)
}

    var shoppinglistItems: [shoppingItem] = []

var unaddedItems: [shoppingItem] {
    return shoppinglistItems.filter({ $0.addedShoppingItems == false })
}

var addedItems: [shoppingItem] {
    return shoppinglistItems.filter({$0.addedShoppingItems})
}

