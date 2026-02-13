//
//  CartView.swift
//  market.app
//
//  Created by abdulaziz on 13/02/2026.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartViewModel

    var body: some View {
        VStack {
            if cart.items.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "cart")
                        .font(.system(size: 48))
                        .foregroundColor(.gray)
                    Text("سلة المشتريات فارغة")
                        .foregroundColor(.gray)
                }
                .padding()
            } else {
                List {
                    ForEach(cart.items) { item in
                        HStack(alignment: .top, spacing: 12) {
                            AsyncImage(url: URL(string: item.product.imageURL)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 64, height: 64)
                            .cornerRadius(8)

                            VStack(alignment: .leading, spacing: 6) {
                                Text(item.product.name)
                                    .font(.headline)

                                Text("\(item.product.price, specifier: "%.2f") ريال")
                                    .foregroundColor(.secondary)

                                HStack {
                                    Button {
                                        cart.decreaseQuantity(for: item)
                                    } label: {
                                        Image(systemName: "minus.circle.fill")
                                            .foregroundColor(.red)
                                            .font(.title3)
                                    }

                                    Text("\(item.quantity)")
                                        .frame(minWidth: 28)

                                    Button {
                                        cart.increaseQuantity(for: item)
                                    } label: {
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.blue)
                                            .font(.title3)
                                    }
                                }
                            }

                            Spacer()

                            Text("\((item.product.price * Double(item.quantity)), specifier: "%.2f") ريال")
                                .font(.headline)
                        }
                        .padding(.vertical, 6)
                        .swipeActions {
                            Button(role: .destructive) {
                                cart.remove(item: item)
                            } label: {
                                Label("حذف", systemImage: "trash")
                            }
                        }
                    }
                }

                VStack(spacing: 12) {
                    HStack {
                        Text("الإجمالي")
                            .font(.headline)
                        Spacer()
                        Text("\(cart.totalPrice, specifier: "%.2f") ريال")
                            .font(.headline)
                    }

                    Button {
                        // منطق الدفع لاحقاً
                    } label: {
                        Text("إتمام الشراء")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(cart.items.isEmpty ? Color.gray : Color.green)
                            .cornerRadius(12)
                    }
                    .disabled(cart.items.isEmpty)
                }
                .padding()
            }
        }
        .navigationTitle("سلة المشتريات")
    }
}

#Preview {
    NavigationStack {
        CartView()
            .environmentObject(CartViewModel())
    }
}
