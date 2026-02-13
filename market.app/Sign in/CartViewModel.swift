//
//  CartViewModel.swift
//  market.app
//
//  Created by abdulaziz on 13/02/2026.
//

import Foundation

@MainActor
final class CartViewModel: ObservableObject {
    @Published private(set) var items: [CartItem] = []

    var totalItemsCount: Int {
        items.reduce(0) { $0 + $1.quantity }
    }

    var totalPrice: Double {
        items.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }

    func add(product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(product: product, quantity: 1))
        }
    }

    func increaseQuantity(for item: CartItem) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[index].quantity += 1
    }

    func decreaseQuantity(for item: CartItem) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
        if items[index].quantity > 1 {
            items[index].quantity -= 1
        } else {
            items.remove(at: index)
        }
    }

    func remove(item: CartItem) {
        items.removeAll { $0.id == item.id }
    }

    func clear() {
        items.removeAll()
    }
}
