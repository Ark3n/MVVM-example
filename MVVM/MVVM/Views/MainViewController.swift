//
//  ViewController.swift
//  MVVM
//
//  Created by Arken Sarsenov on 27.04.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    var viewModel = MainViewModel()
    var cellDataSource = [MainCellViewModel]()
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
        tableView.backgroundColor = .systemRed.withAlphaComponent(0.4)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let activityIndicator = UIActivityIndicatorView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getUsers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self, let isLoading else { return }
            DispatchQueue.main.async {
                isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] users in
            guard let self, let users else { return }
            cellDataSource = users
            reloadTableView()
        }
    }
    
    func presentDeatilsViewController(_ user: User) {
        let detailsViewModel = DetailsViewModel(user)
        let detailsViewController = DetailsViewController(detailsViewModel)
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - Setup Views
private extension MainViewController {
    func setupViews() {
        title = "Main Screen"
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        addSubviews()
        configureConstraints()
    }
    
    func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Layout
private extension MainViewController {
    func configureConstraints() {
        tableView.frame = view.bounds
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
