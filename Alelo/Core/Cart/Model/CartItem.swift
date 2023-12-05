//
//  CartItem.swift
//  Alelo
//
//  Created by Nikolas Gianoglou Coelho on 05/12/2023.
//

import Foundation

import Foundation

struct CartItem: Identifiable, Equatable {
    static func == (lhs: CartItem, rhs: CartItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID().uuidString
    var product: Product
    var amount: Int
    var size: String
}
