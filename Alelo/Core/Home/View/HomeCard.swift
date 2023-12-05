//
//  HomeCard.swift
//  Alelo
//
//  Created by Nikolas Gianoglou Coelho on 05/12/2023.
//

import SwiftUI

struct HomeCard: View {
    var product: Product
    @EnvironmentObject var screenSize: ScreenSize
    
    var body: some View {
        NavigationLink {
            HomeDetails(product: product)
        } label: {
            VStack {
                CustomAsyncImage(product: product, size: screenSize.width * 0.5)
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                        .bold()
                    
                    HStack {
                        if product.on_sale {
                            Text(product.regular_price)
                                .foregroundStyle(.gray)
                                .strikethrough(true, color: Color.red)
                        }
                        Spacer()
                        Text(product.actual_price)
                            .bold()
                    }
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                }
                .foregroundStyle(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    Color.blue
                }
            }
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                    .shadow(color: .gray.opacity(0.2), radius: 5)
            }
            .overlay(alignment: .topTrailing) {
                if product.on_sale {
                    Text("PROMOÇÃO")
                        .lineLimit(1)
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
//                                .fill(.themePrimary)
                        }
                        .padding(12)
                }
            }
        }
    }
}

struct HomeCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeCard(product: dev.product)
    }
}
