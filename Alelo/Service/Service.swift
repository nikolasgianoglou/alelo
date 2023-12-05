//
//  ServiceProtocol.swift
//  Alelo
//
//  Created by Nikolas Gianoglou Coelho on 05/12/2023.
//

import Foundation

protocol ServiceProtocol {
    static func getProducts(url: AppConstants.Urls, completion: @escaping (Result<ProductList, Error>) -> Void)
}

class Service: ServiceProtocol {
    static func getProducts(url: AppConstants.Urls, completion: @escaping (Result<ProductList, Error>) -> Void) {
        guard let url = URL(string: url.rawValue) else {
            completion(.failure(NetworkErrors.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(NetworkErrors.badRequest))
                return
            }
            guard let list = try? JSONDecoder().decode(ProductList.self, from: data) else {
                completion(.failure(NetworkErrors.badRequest))
                return
            }
            completion(.success(list))
        }.resume()
    }
}
