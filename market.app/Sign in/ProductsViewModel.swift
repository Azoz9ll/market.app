//
//  ProductsViewModel.swift
//  market.app
//
//  Created by abdulaziz on 13/02/2026.
//

import Foundation

@MainActor
final class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadProducts() async {
        guard !isLoading else { return }
        isLoading = true
        errorMessage = nil
        do {
            let items = try await ProductManager.shared.getProducts()
            self.products = items
        } catch {
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
