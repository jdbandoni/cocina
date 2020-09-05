//
//  MealServiceMock.swift
//  CocinaTests
//
//  Created by JONATHAN DANIEL BANDONI on 05/09/2020.
//  Copyright © 2020 JONATHAN DANIEL BANDONI. All rights reserved.
//

@testable import Cocina

class MealServiceMock: MealServiceProtocol {

    
    var shouldFail: Bool
    
    required init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }
    
    func fetchMeals(search: String, completion: @escaping ((Result<ReceipeModel, Error>) -> Void)) {
        if !shouldFail {
            completion(.success(mockReceipe(count: 5)))
        } else {
            completion(.failure(ServiceError.noData))
        }
    }
    
    private func mockReceipe(count: Int) -> ReceipeModel {
        var meals = [MealModel]()
        for i in 0..<count {
            meals.append(MealModel(idMeal: String(i), strMeal: "name", strMealThumb: "https://www.themealdb.com/images/media/meals/wtsvxx1511296896.jpg", strCategory: "category"))
        }
        return ReceipeModel(meals: meals)
    }
}

