//
//  Filter.swift
//  Alelo
//
//  Created by Nikolas Gianoglou Coelho on 05/12/2023.
//

import Foundation

enum Filter: CaseIterable {
    case all, onSale
    
    var text: String {
        switch self {
        case .all: return "todos"
        case .onSale: return "promoção"
        }
    }
}
