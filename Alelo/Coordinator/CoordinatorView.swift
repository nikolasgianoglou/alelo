//
//  CoordinatorView.swift
//  Alelo
//
//  Created by Nikolas Gianoglou Coelho on 05/12/2023.
//

import Foundation
import SwiftUI

struct CoordinatorView: View {
    @StateObject var viewModel = CoordinatorViewModel.shared
    
    var body: some View {
        NavigationView {
            switch viewModel.uiState {
            case .home: HomeView()
            }
        }
    }
}
