//
//  ShoppingListCollectionViewCellDelelgate.swift
//  Shopping List
//
//  Created by Steven Leyva on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingListCollectionViewCellDelegate: class {
    func toggleHasBeenAdded(for cell: ShoppingListCollectionViewCell)
}
