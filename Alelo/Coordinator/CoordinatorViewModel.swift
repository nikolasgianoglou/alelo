//
//  CoordinatorViewModel.swift
//  Alelo
//
//  Created by Nikolas Gianoglou Coelho on 05/12/2023.
//

import Foundation

class CoordinatorViewModel: ObservableObject {
    @Published var uiState: Coordinator = .home
    
    static let shared = CoordinatorViewModel()
    private init() {}
}

extension CoordinatorViewModel {
    func goToHome() {
        CoordinatorViewModel.shared.uiState = .home
    }
}
