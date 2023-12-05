//
//  ServiceProtocol.swift
//  Alelo
//
//  Created by Nikolas Gianoglou Coelho on 05/12/2023.
//

import Foundation

protocol ServiceProtocol {
     func getProducts(url: AppConstants.Urls, completion: @escaping (Result<ProductList, Error>) -> Void)
}

class Service: ServiceProtocol {
    func getProducts(url: AppConstants.Urls, completion: @escaping (Result<ProductList, Error>) -> Void) {

        guard let list = loadDataFromMock() else { return }
        completion(.success(list))
    }
    
    func loadDataFromMock() -> ProductList? {
        guard let url = Bundle.main.url(forResource: "product", withExtension: "json")
            else {
                print("Json file not found")
                return nil
            }
        
        let data = try? Data(contentsOf: url)
        let list =  try? JSONDecoder().decode(ProductList.self, from: data!)
        return list
    }
}
