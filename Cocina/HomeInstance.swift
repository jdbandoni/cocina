//
//  HomeInstance.swift
//  Cocina
//
//  Created by JONATHAN DANIEL BANDONI on 05/09/2020.
//  Copyright © 2020 JONATHAN DANIEL BANDONI. All rights reserved.
//

import Foundation

class HomeInstance {
    static let baseUrl = "https://www.themealdb.com/"
    
    static func viewController() -> HomeViewController {
        let presenter = HomeInstance.presenter()
        let viewController = HomeViewController(presenter: presenter)
        presenter.view = viewController
        return viewController
    }
    
    static private func presenter() -> HomePresenter {
        return HomePresenter(repository: MealRepository(service:
        MealService(baseUrl: HomeInstance.baseUrl)), queue: DispatchQueue.main)
    }
}
