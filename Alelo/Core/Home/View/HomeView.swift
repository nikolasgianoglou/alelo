//
//  HomeView.swift
//  Alelo
//
//  Created by Nikolas Gianoglou Coelho on 05/12/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {

            VStack(spacing: 0) {
                
                
                HStack(spacing: 16) {
//                    textfield
                    cartIcon
                }
                .padding(.horizontal)
                
                // MARK: Filtros
                ScrollView(.horizontal) {
                    HStack(spacing: 16) {
                        ForEach(Filter.allCases, id: \.self) { filter in
                            filterItem(filter: filter)
                        }
                    }
                    .padding()
                }
                
                // MARK: Produtos
                ScrollView {
                    VStack {
                        ForEach(viewModel.filteredProducts) { prod in
                            HomeCard(product: prod)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

extension HomeView {
//    var textfield: some View {
//        HStack(spacing: 8) {
//            Image(systemName: "magnifyingglass")
//                .foregroundStyle(Color.black.opacity(0.3))
//            TextField("Buscar", text: $viewModel.searchField)
//        }
//        .frame(height: 50)
//        .padding(.horizontal, 8)
//        .background {
//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.black.opacity(0.3))
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(Color.white)
//            }
//            .shadow(color: .gray.opacity(0.2), radius: 5)
//        }
//    }
    var cartIcon: some View {
        NavigationLink {
            CartView()
        } label: {
            Image(systemName: "cart")
                .foregroundStyle(Color.black.opacity(0.5))
                .frame(width: 50, height: 50)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.2), radius: 5)
                }
        }
    }
    func filterItem(filter: Filter) -> some View {
        Button {
            viewModel.selectedFilter = filter
        } label: {
            Text(filter.text)
                .foregroundStyle(viewModel.selectedFilter == filter ? Color.white : Color.black.opacity(0.5))
                .padding(.vertical, 8)
                .padding(.horizontal)
                .background {
                    RoundedRectangle(cornerRadius: 15)
//                        .fill(viewModel.selectedFilter == filter ? .themePrimary : .white)
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
