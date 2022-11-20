//
//  SettingsHeader.swift
//  BengaliDating
//
//  Created by Arif  on 11/19/22.
//

import UIKit

protocol SettingsHeaderDelegate: AnyObject {
    func settingsHeader( header: SettingsHeader, didSelect index: Int)
}

class SettingsHeader: UIView {

    // Properties
    weak var delegate: SettingsHeaderDelegate?
    var buttons = [UIButton]()

    // helpers

    func setHeaderImage (image: UIImage?) {

    }

    // Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGroupedBackground

        let button1 = createButton(index: 0)
        let button2 = createButton(index: 1)
        let button3 = createButton(index: 2)

        buttons.append(button1)
        buttons.append(button2)
        buttons.append(button3)


        addSubview(button1)
        button1.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 16)
        button1.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45).isActive = true

        let stack = UIStackView(arrangedSubviews: [button2, button3])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        addSubview(stack)

        stack.anchor(top: topAnchor, left: button1.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createButton(index: Int) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Select Photo", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        button.clipsToBounds = true
        button.backgroundColor = .white
        button.tag = index
        button.imageView?.contentMode = .scaleAspectFit

        return button
    }

    // actions
    @objc func handleSelectPhoto(sender: UIButton) {
        delegate?.settingsHeader(header: self, didSelect: sender.tag)
        print("Debug: handle select photo")
    }
}
