//
//  Product.swift
//  Alelo
//
//  Created by Nikolas Gianoglou Coelho on 05/12/2023.
//

import Foundation

struct ProductList: Codable {
    let products: [Product]
}

struct Product: Codable, Identifiable {
    var id: String = UUID().uuidString
    let name: String
    let image: String
    let regular_price: String
    let actual_price: String
    let on_sale: Bool
    let sizes: [ProductSize]
}

struct ProductSize: Codable, Identifiable {
    var id: String = UUID().uuidString
    let available: Bool
    let size: String
    let sku: String
}
