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

        tableView.tableHeaderView = headerView

        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
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

extension SettingsController: SettingsHeaderDelegate {
    func settingsHeader(header: SettingsHeader, didSelect index: Int) {
        present(imagePicker, animated: true, completion: nil)
        self.imageIndex = index
        print("Selected button is \(index)")
    }
}

extension SettingsController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[.originalImage] as? UIImage

        // update photos
        setHeaderImage(image: selectedImage)

        dismiss(animated: true, completion: nil)
    }
}


