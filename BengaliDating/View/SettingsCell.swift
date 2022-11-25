//
//  SettingsCell.swift
//  BengaliDating
//
//  Created by Arif  on 11/23/22.
//

import UIKit

class SettingsCell: UITableViewCell {

    // Properties
    var sliderStack = UIStackView()

    var viewModel: SettingsViewModel! {
        didSet { configure() }
    }

    lazy var inputField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.placeholder = "Enter value here..."

        let paddingView = UIView()
        paddingView.setDimensions(height: 50, width: 28)
        tf.leftView = paddingView
        tf.leftViewMode = .always

        return tf
    }()

    let minAgeLabel = UILabel()
    let maxAgeLabel = UILabel()

    lazy var minAgeSlider = createAgeRangeSlider()
    lazy var maxAgeSlider = createAgeRangeSlider()


    // Lifecycle


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        minAgeLabel.text = "Min: 18"
        maxAgeLabel.text = "Max: 60"

        addSubview(inputField)
        inputField.fillSuperview()

        let minStack = UIStackView(arrangedSubviews: [minAgeLabel, minAgeSlider])
        minStack.spacing = 24

        let maxStack = UIStackView(arrangedSubviews: [maxAgeLabel, maxAgeSlider])
        maxStack.spacing = 24

        sliderStack = UIStackView(arrangedSubviews: [minStack, maxStack])
        sliderStack.axis = .vertical
        sliderStack.spacing = 16

        addSubview(sliderStack)
        sliderStack.centerY(inView: self)
        sliderStack.anchor(left: leftAnchor, right: rightAnchor, paddingLeft: 24, paddingRight: 24)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) have not been implemented")
    }

    // Actions

    @objc func handleAgeRangeChanged() {

    }

    // Helpers

    func configure() {
        inputField.isHidden = viewModel.shouldHideInputField
        sliderStack.isHidden = viewModel.shouldHideSlider
    }

    func createAgeRangeSlider() -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 18
        slider.maximumValue = 60
        slider.addTarget(self, action: #selector(handleAgeRangeChanged), for: .valueChanged)
        return slider
    }
}
