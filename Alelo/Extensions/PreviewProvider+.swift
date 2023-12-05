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
    
    let product = Product(name: "", style: "", codeColor: "", colorSlug: "", color: "", onSale: true, regularPrice: "", actualPrice: "", discountPercentage: "", installments: "", image: "", sizes: [Size(available: true, size: "", sku: "")])
        
        
    
    
}
