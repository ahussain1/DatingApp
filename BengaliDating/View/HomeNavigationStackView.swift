//
//  HomeNavigationStackView.swift
//  BengaliDating
//
//  Created by Arif  on 11/12/22.
//

import UIKit

class HomeNavigationStackView: UIStackView {
    // Mark: properties
    let settingsButton = UIButton(type: .system)
    let messageButton =  UIButton(type: .system)
    let appIcon = UIImageView(image: UIImage(imageLiteralResourceName: "app_icon"))
    
    //Mark: lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsButton.setImage(UIImage(imageLiteralResourceName: "top_left_profile").withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.setImage(UIImage(imageLiteralResourceName: "top_messages_icon").withRenderingMode(.alwaysOriginal), for: .normal)
        
        [settingsButton, UIView(), appIcon, UIView(), messageButton].forEach { view in
            addArrangedSubview(view)
        }
        distribution = .equalCentering
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
