//
//  HomeViewControllerMock.swift
//  CocinaTests
//
//  Created by JONATHAN DANIEL BANDONI on 05/09/2020.
//  Copyright © 2020 JONATHAN DANIEL BANDONI. All rights reserved.
//

import Foundation
@testable import Cocina

class HomeViewControllerMock: HomeViewDelegate {
    var items: [MealModel]?
    var alertTitle: String?
    var alertMessage: String?
    
    var showItemsWasCalled = false
    var showAlertWasCalled = false
    var showLoadingWasCalled = false
    var hideLoadingWasCalled = false
    
    func show(items: [MealModel]) {
        self.items = items
        showItemsWasCalled = true
    }
    
    func showAlert(title: String, message: String) {
        self.alertTitle = title
        self.alertMessage = message
        showAlertWasCalled = true
    }
    
    func showLoading() {
        showLoadingWasCalled = true
    }
    
    func hideLoading() {
        hideLoadingWasCalled = true
    }
}
