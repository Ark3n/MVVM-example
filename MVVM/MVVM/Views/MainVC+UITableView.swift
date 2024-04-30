//
//  MainVC+UITableView.swift
//  MVVM
//
//  Created by Arken Sarsenov on 27.04.2024.
//

import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier , for: indexPath) as? MainCell else { return UITableViewCell()}
        let cellViewModel = cellDataSource[indexPath.row]
        cell.setupCell(cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dataSource = viewModel.dataSource else { return }
        presentDeatilsViewController(dataSource[indexPath.row])
    }
}
