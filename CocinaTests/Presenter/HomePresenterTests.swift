//
//  HomePresenterTests.swift
//  CocinaTests
//
//  Created by JONATHAN DANIEL BANDONI on 05/09/2020.
//  Copyright © 2020 JONATHAN DANIEL BANDONI. All rights reserved.
//

import Quick
import Nimble
@testable import Cocina

class HomePresenterTestsest: QuickSpec {
    
    var vc: HomeViewControllerMock!
    var presenter: HomePresenter!
    let queue = DispatchQueue(label: "HomePresenterTest")
    
    override func spec() {
        describe("Home Presenter Test") {
            context("When init presenter with mock repository empty list and view loaded") {
                
                beforeEach {
                    self.vc = HomeViewControllerMock()
                    self.presenter = HomeUseCasesInstance.resolvePresenter(useCase: .homeFetchEmpty, view: self.vc, queue: self.queue)
                    self.presenter.viewLoaded()
                    self.queue.sync {}
                }
                
                it("Should fetch an empty list of meals and behave correctly") {
                
                    expect(self.vc.showLoadingWasCalled).to(beTrue())
                    expect(self.vc.showItemsWasCalled).to(beTrue())
                    expect(self.vc.hideLoadingWasCalled).to(beTrue())
                    expect(self.vc.showAlertWasCalled).to(beFalse())
                }
                
                it("Should fetch an empty list of meals and set view correctly") {
                    expect(self.vc.items).to(beEmpty())
                    expect(self.vc.alertTitle).to(beNil())
                    expect(self.vc.alertMessage).to(beNil())
                }
            }
            
            context("When init presenter with mock repository 5 meals and view loaded") {
                
                beforeEach {
                    self.vc = HomeViewControllerMock()
                    self.presenter = HomeUseCasesInstance.resolvePresenter(useCase: .homeFetchFive, view: self.vc, queue: self.queue)
                    self.presenter.viewLoaded()
                    self.queue.sync {}
                }
                
                it("Should fetch five meals and behave correctly") {
                    expect(self.vc.showLoadingWasCalled).to(beTrue())
                    expect(self.vc.showItemsWasCalled).to(beTrue())
                    expect(self.vc.hideLoadingWasCalled).to(beTrue())
                    expect(self.vc.showAlertWasCalled).to(beFalse())
                }
                
                it("Should fetch five meals and set view correctly") {
                    expect(self.vc.items?.count).to(be(5))
                    expect(self.vc.alertTitle).to(beNil())
                    expect(self.vc.alertMessage).to(beNil())
                }
            }
            
            context("When init presenter with mock fail repository") {
                
                beforeEach {
                    self.vc = HomeViewControllerMock()
                    self.presenter = HomeUseCasesInstance.resolvePresenter(useCase: .homeFetchError, view: self.vc, queue: self.queue)
                    self.presenter.viewLoaded()
                    self.queue.sync {}
                }
                
                it("Should fetch five meals and behave correctly") {
                    expect(self.vc.showLoadingWasCalled).to(beTrue())
                    expect(self.vc.showItemsWasCalled).to(beFalse())
                    expect(self.vc.hideLoadingWasCalled).to(beTrue())
                    expect(self.vc.showAlertWasCalled).to(beTrue())
                }
                
                it("Should fetch five meals and set view correctly") {
                    expect(self.vc.items).to(beNil())
                    expect(self.vc.alertTitle).to(equal("Error"))
                    expect(self.vc.alertMessage).to(equal("Ups! Algo salió mal"))
                }
            }
            
        }
    }
}
