//
//  CardView.swift
//  BengaliDating
//
//  Created by Arif  on 11/12/22.
//

import UIKit

class CardView: UIView {
    
    // Mark: - properties
    
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(imageLiteralResourceName: "sushmi1")
        return iv
    }()
    
    // Mark: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemRed
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
