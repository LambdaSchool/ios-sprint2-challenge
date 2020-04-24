//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Aaron Cleveland on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable, Equatable {
    let name: String
    var added: Bool = false
}
