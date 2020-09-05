//
//  MealRepositoryStub.swift
//  CocinaTests
//
//  Created by JONATHAN DANIEL BANDONI on 05/09/2020.
//  Copyright © 2020 JONATHAN DANIEL BANDONI. All rights reserved.
//

import Foundation
@testable import Cocina

class MealRepositoryStub: MealRepositoryProtocol {
    
    var mock: [MealModel]?
    
    
    init(_ mock: [MealModel]? = nil) {
        self.mock = mock
    }
    
    func getMeals(search: String, onSuccess: @escaping ([MealModel]) -> Void, onError: @escaping (Error) -> Void) {
        if let mock = mock {
            onSuccess(mock)
        } else {
            onError(ServiceError.noData)
        }
    }
}
