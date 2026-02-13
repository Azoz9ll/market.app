//
//  CartItem.swift
//  market.app
//
//  Created by abdulaziz on 13/02/2026.
//

import Foundation

struct CartItem: Identifiable, Hashable {
    let id: String
    let product: Product
    var quantity: Int

    init(product: Product, quantity: Int = 1) {
        self.id = product.id
        self.product = product
        self.quantity = quantity
    }
}
