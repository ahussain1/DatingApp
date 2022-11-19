//
//  HomeController.swift
//  BengaliDating
//
//  Created by Arif  on 11/12/22.
//

import UIKit
import Firebase

class HomeController: UIViewController {
    
    // Mark: - Properties
    
    private let topStack = HomeNavigationStackView()
    private let bottomStack = BottomControlsStackView()
    
    private let deckView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 5
        return view
    }()
    
    // Mark: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureCards()
        checkIfUserIsLoggedIn()
        fetchUser()
//        logout()
    }
    
    // API
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Service.fetchUser(withUid: uid) { user in
            print("Debug: user is \(user.name)")
        }
    }
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser == nil {
            presentLoginController()
        } else {
            print("Debug: user is logged in")
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            presentLoginController()
        } catch {
            print("debug: failed to sign out")
        }
    }
    
    // Mark: - Helpers
    
    func configureCards() {
//        
//        let user1 = User(name: "Jane Doe", age: 21, images: [UIImage(imageLiteralResourceName: "jane1"), UIImage(imageLiteralResourceName: "jane2"), UIImage(imageLiteralResourceName: "jane3")])
//
//        let user2 = User(name: "Megan Smith", age: 22, images: [UIImage(imageLiteralResourceName: "kelly1"), UIImage(imageLiteralResourceName: "kelly2"), UIImage(imageLiteralResourceName: "kelly3")])
//
//
//        let cardView1 = CardView(viewModel: CardViewModel(user: user1))
//        let cardView2 = CardView(viewModel: CardViewModel(user: user2))
//
//        deckView.addSubview(cardView1)
//        deckView.addSubview(cardView2)
//
//        cardView1.fillSuperview()
//        cardView2.fillSuperview()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        let stack = UIStackView(arrangedSubviews: [topStack, deckView, bottomStack])
        stack.axis = .vertical
        
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
        
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
    }
    
    func presentLoginController() {
        DispatchQueue.main.async {
            let controller = LoginController()
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: false, completion: nil)
        }
    }
}
