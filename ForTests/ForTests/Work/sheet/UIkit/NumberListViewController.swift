//
//  NumberListViewController.swift
//  ForTests
//
//  Created by Игорь Чумиков on 15.05.2025.
//

import SwiftUI

class NumberListViewController: UIViewController, UITableViewDataSource {
    private let tableView = UITableView()
    private let numbers = Array(1...100)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Список чисел"

        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numbers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Число: \(numbers[indexPath.row])"
        return cell
    }
}


// MARK: - SwiftUI Preview

#Preview {
    NumberListViewController()
}
