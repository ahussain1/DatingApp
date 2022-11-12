//
//  HomeController.swift
//  BengaliDating
//
//  Created by Arif  on 11/12/22.
//

import UIKit

class HomeController: UIViewController {
    
    // Mark: - Properties
    
    private let topStack = HomeNavigationStackView()
    
    // Mark: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // Mark: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(topStack)
        topStack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
    }
}
