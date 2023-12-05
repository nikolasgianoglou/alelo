//
//  HomeDetails.swift
//  Alelo
//
//  Created by Nikolas Gianoglou Coelho on 05/12/2023.
//

import SwiftUI

import SwiftUI

struct HomeDetails: View {
    var product: Product
    
    @EnvironmentObject var screenSize: ScreenSize
    @Environment(\.dismiss) var dismiss
    @State var selectedSize = ""
    @State var amount = 1
    @State var highlightSize = false
    
    var body: some View {
        ZStack {
//            Color.themeSecondary
//                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                CustomBackButton()
                
                CustomAsyncImage(product: product, size: screenSize.width * 0.5)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background {
                        Color.white
                            .shadow(color: .gray.opacity(0.2), radius: 5)
                    }
                
                Text(product.name)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
                    .padding(.horizontal)
                
                if product.on_sale {
                    Text("PROMOÇÃO")
                        .font(.title2)
                        .foregroundStyle(Color.white)
                        .bold()
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.blue)
                        }
                    
                    HStack(spacing: 6) {
                        Text("de")
                        Text(product.regular_price)
                            .bold()
                            .foregroundStyle(Color.black.opacity(0.35))
                            .strikethrough(true, color: Color.red)
                        Text("por")
                        Text(product.actual_price)
                            .bold()
                    }
                    .font(.title3)
                } else {
                    Text(product.regular_price)
                        .bold()
                        .font(.title3)
                }
                
                Spacer()
                
                VStack {
                    Divider()
                    
                    HStack {
                        Text("Tamanho:")
                            .font(.title3)
                            .foregroundStyle(highlightSize ? Color.red : Color.black)
                        
                        Spacer()
                        
                        Menu {
                            ForEach(product.sizes) { size in
                                if size.available {
                                    Button {
                                        selectedSize = size.size
                                    } label: {
                                        Text(size.size)
                                    }
                                }
                            }
                        } label: {
                            Text(!selectedSize.isEmpty ? selectedSize : "Selecione")
                                .font(.title3)
                                .bold()
                                .foregroundStyle(highlightSize ? Color.red : Color.black)
                        }
                        
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Quantidade:")
                            .font(.title3)
                        
                        Spacer()
                        
                        CustomStepper(amount: $amount)
                    }
                    
                    Divider()
                }
                .padding(.horizontal, screenSize.width * 0.1)
                
                Button {
                    addToCart()
                } label: {
                    Text("Adicionar ao carrinho")
                        .font(.title2)
                        .foregroundStyle(Color.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(selectedSize.isEmpty ? Color.gray : Color.blue)
                        }
                }
                .padding(.horizontal)
                
            }
            .toolbar(.hidden)
        }
    }
}

extension HomeDetails {
    func addToCart() {
        if selectedSize.isEmpty {
            highlightSize = true
        } else {
            let cartItem = CartItem(product: product, amount: amount, size: selectedSize)
            CartViewModel.shared.addProduct(item: cartItem)
            highlightSize = false
            dismiss()
        }
    }
}

struct HomeDetails_Previews: PreviewProvider {
    static var previews: some View {
        HomeDetails(product: dev.product)
    }
}
