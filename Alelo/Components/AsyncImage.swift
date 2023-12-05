//
//  CustomAsyncImage.swift
//  Alelo
//
//  Created by Nikolas Gianoglou Coelho on 05/12/2023.
//

import SwiftUI

struct CustomAsyncImage: View {
    var product: Product
    var size: CGFloat
    
    var body: some View {
        Group {

            if let url = URL(string: product.image) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ZStack {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()

                            .padding(size / 5)

                        ProgressView()
                    }
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .padding(size / 5)
            }
        }
        .frame(height: size)
    }
}

struct CustomAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomAsyncImage(product: dev.product, size: 10)
    }
}
