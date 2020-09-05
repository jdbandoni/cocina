//
//  HomePresenter.swift
//  Cocina
//
//  Created by JONATHAN DANIEL BANDONI on 05/09/2020.
//  Copyright © 2020 JONATHAN DANIEL BANDONI. All rights reserved.
//

import Foundation

protocol HomeViewDelegate: class {
    func showLoading()
    func hideLoading()
}

class HomePresenter {
    
    weak var view: HomeViewDelegate?
    let repository: MealRepositoryProtocol
    let queue: DispatchQueue
    
    required init(repository: MealRepositoryProtocol, queue: DispatchQueue) {
        self.repository = repository
        self.queue = queue
    }
    
    func viewLoaded() {
        
    }
    
    
    private func getMeals(search: String) {
        view?.showLoading()
        repository.getMeals(search: search, onSuccess: { (meals) in
            self.handleOnSuccess(meals)
        }) { (error) in
            self.handleOnError()
        }
    }
    
    private func handleOnSuccess(_ meals: [MealModel]) {
        self.queue.async {
            self.view?.hideLoading()
            //show
        }
    }
    
    private func handleOnError() {
        self.queue.async {
            self.view?.hideLoading()
            //Error
        }
    }
    
}
