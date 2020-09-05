//
//  ViewController.swift
//  Cocina
//
//  Created by JONATHAN DANIEL BANDONI on 05/09/2020.
//  Copyright © 2020 JONATHAN DANIEL BANDONI. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let presenter: HomePresenter
    private let reuseIdentifier = "CellIdentifier"
    private var items = [MealModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .white)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    required init(presenter: HomePresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: HomeViewController.self), bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Busca tus recetas"
        setupView()
        presenter.viewLoaded()
    }


    private func setupView() {
        tableView.register(UINib(nibName: "MealTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 132
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }
    
}

extension HomeViewController: HomeViewDelegate {
    func show(items: [MealModel]) {
        self.items = items
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showLoading() {
        spinner.startAnimating()
        view.addSubview(spinner)
        view.bringSubviewToFront(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func hideLoading() {
        if spinner.isDescendant(of: self.view) {
            spinner.stopAnimating()
            spinner.removeFromSuperview()
        }
    }
    
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? MealTableViewCell else { return UITableViewCell() }
        let meal = items[indexPath.row]
        
        cell.configureCell(image: meal.strMealThumb, name: meal.strMeal, category: meal.strCategory)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: show details
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.getMeals(search: searchText)
    }
}
