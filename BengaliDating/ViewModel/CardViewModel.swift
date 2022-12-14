//
//  CardViewModel.swift
//  BengaliDating
//
//  Created by Arif  on 11/13/22.
//

import UIKit

class CardViewModel {
    
    let user: User
    let userInfoText: NSAttributedString
    private var imageIndex = 0
    
    var imageUrl: URL?
    
    init(user: User) {
        self.user = user
        
        let attributedText = NSMutableAttributedString(string: user.name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy), .foregroundColor: UIColor.white])
        
        attributedText.append(NSAttributedString(string: "  \(user.age)", attributes: [.font: UIFont.systemFont(ofSize: 32), .foregroundColor: UIColor.white]))
        
        self.userInfoText = attributedText
        self.imageUrl = URL(string: user.profileImageUrl)
    }
    
    func showNextPhoto() {
//        guard imageIndex < user.images.count - 1 else { return }
//        imageIndex += 1
//        self.imageToShow = user.images[imageIndex]
//
//        print("Debug: Show next...")
    }
    
    func showPreviousPhoto() {
//        guard imageIndex > 0 else { return }
//        imageIndex = imageIndex - 1
//        self.imageToShow = user.images[imageIndex]
//        print("Debug: Show previous...")
    }
}
