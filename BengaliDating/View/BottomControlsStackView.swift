//
//  BottomControlsStackView.swift
//  BengaliDating
//
//  Created by Arif  on 11/12/22.
//

import UIKit

class BottomControlsStackView: UIStackView {
    // Mark: properties
    let refreshButton = UIButton(type: .system)
    let dislikeButton =  UIButton(type: .system)
    let superlikeButton =  UIButton(type: .system)
    let likeButton =  UIButton(type: .system)
    let boostButton =  UIButton(type: .system)

    
    //Mark: lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        distribution = .fillEqually
        
        refreshButton.setImage(UIImage(imageLiteralResourceName: "refresh_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        dislikeButton.setImage(UIImage(imageLiteralResourceName: "dismiss_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        superlikeButton.setImage(UIImage(imageLiteralResourceName: "super_like_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        likeButton.setImage(UIImage(imageLiteralResourceName: "like_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        boostButton.setImage(UIImage(imageLiteralResourceName: "boost_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        
        [refreshButton, dislikeButton, superlikeButton, likeButton, boostButton].forEach { view in
            addArrangedSubview(view)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

