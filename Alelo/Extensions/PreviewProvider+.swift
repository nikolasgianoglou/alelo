//
//  PreviewProvider+.swift
//  Alelo
//
//  Created by Nikolas Gianoglou Coelho on 05/12/2023.
//

import Foundation
import SwiftUI

extension PreviewProvider {

    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }

}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let product = Product(name: "product",
                          image: "image",
                          regular_price: "RS 2,00",
                          actual_price: "",
                          on_sale: true,
                          sizes: [ProductSize(available: true, size: "", sku: "")])
    
    
    
}
