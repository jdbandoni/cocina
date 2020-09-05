//
//  MealService.swift
//  Cocina
//
//  Created by JONATHAN DANIEL BANDONI on 05/09/2020.
//  Copyright © 2020 JONATHAN DANIEL BANDONI. All rights reserved.
//

import Foundation

protocol MealServiceProtocol {
    func fetchMeals(search: String, completion: @escaping ((Result<ReceipeModel, Error>) -> Void))
}

class MealService: MealServiceProtocol {
    let baseUrl: String
    private let urlSession = URLSession.shared
    
    required init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func fetchMeals(search: String, completion: @escaping ((Result<ReceipeModel, Error>) -> Void)) {
        guard let url = URL(string: "\(baseUrl)api/json/v1/1/search.php?s=\(search)") else {
            completion(.failure(ServiceError.notFound))
            return
        }
        
        let request = URLRequest(url: url)
        
        urlSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(ServiceError.noData))
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode(ReceipeModel.self, from: data) {
                completion(.success(decodedResponse))
                return
            }
            completion(.failure(ServiceError.parseError))
            
        }.resume()
    }

}
