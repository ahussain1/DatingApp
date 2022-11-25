//
//  HomeNavigationStackView.swift
//  BengaliDating
//
//  Created by Arif  on 11/12/22.
//

import UIKit

protocol HomeNavigationStackViewDelegate: AnyObject {
    func showSettings()
    func showMessages()
}

class HomeNavigationStackView: UIStackView {
    // Mark: properties
    let settingsButton = UIButton(type: .system)
    let messageButton =  UIButton(type: .system)
    let appIcon = UIImageView(image: UIImage(imageLiteralResourceName: "app_icon"))
    weak var delegate: HomeNavigationStackViewDelegate?
    
    //Mark: lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        appIcon.contentMode = .scaleAspectFit
        
        settingsButton.setImage(UIImage(imageLiteralResourceName: "top_left_profile").withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.setImage(UIImage(imageLiteralResourceName: "top_right_messages").withRenderingMode(.alwaysOriginal), for: .normal)
        
        [settingsButton, UIView(), appIcon, UIView(), messageButton].forEach { view in
            addArrangedSubview(view)
        }
        distribution = .equalCentering
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        settingsButton.addTarget(self, action: #selector(handleShowSettings), for: .touchUpInside)
        messageButton.addTarget(self, action: #selector(handleShowMessages), for: .touchUpInside)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleShowSettings() {
        delegate?.showSettings()
        print("Debug: handle show settings")
    }
    
    @objc func handleShowMessages() {
        delegate?.showMessages()
        print("Debug: handle show messages")
    }
}

