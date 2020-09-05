//
//  HomeUseCasesInstance.swift
//  CocinaTests
//
//  Created by JONATHAN DANIEL BANDONI on 05/09/2020.
//  Copyright © 2020 JONATHAN DANIEL BANDONI. All rights reserved.
//

import Foundation
@testable import Cocina

class HomeUseCasesInstance {
    
    static func resolveMealRepository(useCase: HomeServiceUsesCases) -> MealRepository {
        let mealRepository = MealRepository(service: resolveMealService(useCase: useCase))
        return mealRepository
    }
    
    static private func resolveMealService(useCase: HomeServiceUsesCases) -> MealServiceProtocol {
        switch useCase {
        case .success:
            return MealServiceMock()
        case .failure:
            return MealServiceMock(shouldFail: true)
        }
    }
    
    static func resolvePresenter(useCase: HomeUsesCases, view: HomeViewDelegate, queue: DispatchQueue) -> HomePresenter {
        let presenter = HomePresenter(repository: resolveRepository(useCase: useCase), queue: queue)
        presenter.view = view
        return presenter
    }
    
    static private func resolveRepository(useCase: HomeUsesCases) -> MealRepositoryProtocol {
        switch useCase {
        case .homeFetchEmpty:
            let mock = mockMeals(count: 0)
            return MealRepositoryStub(mock)
        case .homeFetchError:
            return MealRepositoryStub()
        case .homeFetchFive:
            let mock = mockMeals(count: 5)
            return MealRepositoryStub(mock)
        }
    }
    
    private static func mockMeals(count: Int) -> [MealModel] {
        var meals = [MealModel]()
        for i in 0..<count {
            meals.append(MealModel(idMeal: String(i), strMeal: "name", strMealThumb: "https://www.themealdb.com/images/media/meals/wtsvxx1511296896.jpg", strCategory: "category"))
        }
        return meals
    }
}

