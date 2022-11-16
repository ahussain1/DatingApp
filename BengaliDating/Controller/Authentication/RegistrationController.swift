//
//  RegistrationController.swift
//  BengaliDating
//
//  Created by Arif  on 11/14/22.
//

import UIKit

class RegistrationController: UIViewController {
    
    // Properties
    
    private let selectPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(imageLiteralResourceName: "plus_photo"), for: .normal)
        button.addTarget(self, action: #selector(selectPhoto), for: .touchUpInside)
        
        return button
    }()
    
    private let emailTextField = CustomTextField(placeholder: "Email")
    private let fullNameTextField = CustomTextField(placeholder: "Full Name")
    private let passwordTextField = CustomTextField(placeholder: "Password", isSecureField: true)
    
    private var authButton: AuthButton = {
        let button = AuthButton(title: "Register", type: .system)
        button.addTarget(self, action: #selector(handleRegisterUser), for: .touchUpInside)
        return button
    }()
    
    private let goToLoginButton: UIButton = {
        let button = UIButton()
        let attributedTitle = NSMutableAttributedString(string: "Already have an account? ", attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 16)])
        
        attributedTitle.append(NSAttributedString(string: "Sign up", attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 16)]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(showLogin), for: .touchUpInside)
        return button
    }()
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // Actions
    @objc func selectPhoto() {
        print("Debug: handle select photo here...")
    }
    
    @objc func handleRegisterUser() {
        print("Debug: register user")
    }
    
    @objc func showLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    // helpers
    
    func configureUI() {
        configureGradientLayer()
        view.addSubview(selectPhotoButton)
        selectPhotoButton.setDimensions(height: 275, width: 275)
        selectPhotoButton.centerX(inView: view)
        selectPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 8)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, fullNameTextField, passwordTextField, authButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: selectPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(goToLoginButton)
    
        goToLoginButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
    }
    
}
