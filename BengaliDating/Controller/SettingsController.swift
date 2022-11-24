//
//  SettingsController.swift
//  BengaliDating
//
//  Created by Arif  on 11/19/22.
//

import UIKit

private let reuseIdentifier = "SettingsCell"


class SettingsController: UITableViewController {

    // properties

    private let headerView = SettingsHeader()
    private let imagePicker = UIImagePickerController()
    private var imageIndex = 0

    // lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        headerView.delegate = self
        imagePicker.delegate = self
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .black

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))

        tableView.separatorStyle = .none
        tableView.tableHeaderView = headerView
        tableView.backgroundColor = .systemGroupedBackground
        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)

        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        headerView.backgroundColor = .systemPurple
    }

    // helpers

    func setHeaderImage(image: UIImage?) {
        headerView.buttons[imageIndex].setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
    }

    // Actions

    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }

    @objc func handleDone() {
        print("Debug: handle done")
    }
}


// UITableViewDataSource
extension SettingsController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSection.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
        return cell
    }
}


// UITableViewDelegate
extension SettingsController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("Debug: section is \(section)")
        guard let section = SettingsSection(rawValue: section) else { return nil }
        print("Debug: section enum raw value is \(section.rawValue)")
        print("Debug: Section description is \(section.description) for value \(section.rawValue)")
        return section.description
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = SettingsSection(rawValue: indexPath.section) else { return 0}
        return section == .ageRange ? 96 : 44
    }
}

// SettingsHeaderDelegate
extension SettingsController: SettingsHeaderDelegate {
    func settingsHeader(header: SettingsHeader, didSelect index: Int) {
        self.imageIndex = index
        present(imagePicker, animated: true, completion: nil)
        print("Selected button is \(index)")
    }
}


// UIImagePickerControllerDelegate
extension SettingsController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[.originalImage] as? UIImage

        // update photos
        setHeaderImage(image: selectedImage)

        dismiss(animated: true, completion: nil)
    }
}


