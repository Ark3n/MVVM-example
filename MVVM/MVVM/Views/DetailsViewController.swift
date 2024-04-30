//
//  DetailsViewController.swift
//  MVVM
//
//  Created by Arken Sarsenov on 28.04.2024.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    let detailsViewModel: DetailsViewModel
    
    let nameLabel = UILabel()
    let usernameLabel = UILabel()
    let emailLabel = UILabel()
    let phoneLabel = UILabel()
    let streetLabel = UILabel()
    let suiteLabel = UILabel()
    let cityLabel = UILabel()
    
    private var labelsStackView = UIStackView()
    
    init(_ detailsViewModel: DetailsViewModel) {
        self.detailsViewModel = detailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        title = "DetailsView"
        view.backgroundColor = .systemBlue
        labelsStackView = UIStackView(arrangedSubviews: [nameLabel,
                                                         usernameLabel,
                                                         emailLabel,
                                                         phoneLabel,
                                                         streetLabel,
                                                         suiteLabel,
                                                         cityLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 5
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        addViews()
        setupConstraints()
        displayUserInfo()
        
    }
    
    private func displayUserInfo() {
        nameLabel.text = "name: " + detailsViewModel.name
        usernameLabel.text = "username: " + detailsViewModel.username
        emailLabel.text = "email: " + detailsViewModel.email
        phoneLabel.text = "phone: " + detailsViewModel.phone
        streetLabel.text = "street: " + detailsViewModel.street
        suiteLabel.text = "suite: " + detailsViewModel.suite
        cityLabel.text = "city: " + detailsViewModel.city
    }
}

extension DetailsViewController {
    private func addViews() {
        view.addSubview(labelsStackView)
    }
    
    private func setupConstraints() {
        labelsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        labelsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
}
