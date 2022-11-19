//
//  SettingsController.swift
//  BengaliDating
//
//  Created by Arif  on 11/19/22.
//

import UIKit

class SettingsController: UITableViewController {

    // properties

    private let headerView = SettingsHeader()
    
    // lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .black

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))

        tableView.tableHeaderView = headerView

        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
    }

    // Actions

    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }

    @objc func handleDone() {
        print("Debug: handle done")
    }

}
