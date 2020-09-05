//
//  MealRepositoryTests.swift
//  CocinaTests
//
//  Created by JONATHAN DANIEL BANDONI on 05/09/2020.
//  Copyright © 2020 JONATHAN DANIEL BANDONI. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Cocina

class MealRepositoryTests: QuickSpec {
    
    var repository: MealRepository!
    
    override func spec() {
        describe("Meal Repository Implementation Test") {
            context("When initialize repository with success mock MealService") {
                
                beforeEach {
                    self.repository = HomeUseCasesInstance.resolveMealRepository(useCase: .success)
                }
                
                it("Should return success with data") {
                    self.repository.getMeals(search: "some", onSuccess: { (meals) in
                        expect(meals.count).to(equal(5))
                    }) { (error) in
                        fail()
                    }
                    
                }
            }
            
            context("When initialize repository with failed mock MealService") {
                 
                beforeEach {
                    self.repository = HomeUseCasesInstance.resolveMealRepository(useCase: .failure)
                }
                
                it("Should return error") {
                    self.repository.getMeals(search: "some", onSuccess: { (meals) in
                        fail()
                    }) { (error) in
                        expect(error).toNot(beNil())
                    }
                }
            }
        }
    }
}

