//
//  MealRepository.swift
//  Cocina
//
//  Created by JONATHAN DANIEL BANDONI on 05/09/2020.
//  Copyright © 2020 JONATHAN DANIEL BANDONI. All rights reserved.
//

import Foundation

import Foundation

protocol MealRepositoryProtocol {
    func getMeals(search: String, onSuccess: @escaping ([MealModel]) -> Void, onError: @escaping (Error) -> Void)
}

class MealRepository: MealRepositoryProtocol {
    let service: MealServiceProtocol
    
    init(service: MealServiceProtocol) {
        self.service = service
    }
    
    func getMeals(search: String, onSuccess: @escaping ([MealModel]) -> Void, onError: @escaping (Error) -> Void) {
        service.fetchMeals(search: search) { result in
            switch(result) {
            case .success(let response):
                onSuccess(response.meals)
                break
                
            case .failure(let error):
                onError(error)
                break
            }
        }
    }

}
