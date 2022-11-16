//
//  AuthenticationViewModel.swift
//  BengaliDating
//
//  Created by Arif  on 11/16/22.
//

import UIKit

protocol AuthenticationViewModel {
    var formIsValid: Bool { get }
}

struct LoginViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
}

struct RegistrationViewModel: AuthenticationViewModel {
    var fullName: String?
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullName?.isEmpty == false
    }
}
