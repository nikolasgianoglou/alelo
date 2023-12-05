//
//  NetworkErrors.swift
//  Alelo
//
//  Created by Nikolas Gianoglou Coelho on 05/12/2023.
//

import Foundation

enum NetworkErrors: LocalizedError {
    case invalidUrl, badRequest, decodingError
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl: return "URL inválida."
        case .badRequest: return "Falha na requisição."
        case .decodingError: return "Erro ao decodificar JSON."
        }
    }
}
