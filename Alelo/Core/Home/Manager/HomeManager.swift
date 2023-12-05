//
//  HomeManager.swift
//  Alelo
//
//  Created by Nikolas Gianoglou Coelho on 05/12/2023.
//

import Foundation

protocol HomeManagerProtocol {
    func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void)
}

class HomeManager: HomeManagerProtocol {
    let webservice: WebServiceProtocol
    
    init(webservice: WebServiceProtocol = Webservice()) {
        self.webservice = webservice
    }
    
    func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void) {
        Webservice.getProducts(url: AppConstants.Urls.productList, completion: completion)
    }
}
