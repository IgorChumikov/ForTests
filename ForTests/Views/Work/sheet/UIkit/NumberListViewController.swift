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
    private let buttonHostingController = UIHostingController(rootView: SwiftUIViewTestSheet())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Список чисел"

        // Add SwiftUI button view
        addChild(buttonHostingController)
        view.addSubview(buttonHostingController.view)
        buttonHostingController.didMove(toParent: self)
        buttonHostingController.view.translatesAutoresizingMaskIntoConstraints = false

        // Add TableView
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        // Layout
        NSLayoutConstraint.activate([
            buttonHostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonHostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonHostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonHostingController.view.heightAnchor.constraint(equalToConstant: 60),

            tableView.topAnchor.constraint(equalTo: buttonHostingController.view.bottomAnchor),
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
