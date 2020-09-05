//
//  ViewController.swift
//  Cocina
//
//  Created by JONATHAN DANIEL BANDONI on 05/09/2020.
//  Copyright © 2020 JONATHAN DANIEL BANDONI. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let presenter: HomePresenter
    
    required init(presenter: HomePresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: HomeViewController.self), bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    func setupView() {
        
    }
    
}

extension HomeViewController: HomeViewDelegate {
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    
}
