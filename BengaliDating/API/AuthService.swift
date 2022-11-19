//
//  AuthService.swift
//  BengaliDating
//
//  Created by Arif  on 11/17/22.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullName: String
    let profileImage: UIImage
}

struct AuthService {
    
    static func logUserIn(withEmail email: String, password: String, completion:  @escaping(AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    static func registerUser(withCredentials credentials: AuthCredentials, completion: (@escaping(Error?) -> Void)) {
        Service.uploadImage(image: credentials.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) {
                (result, error) in
                if let error = error {
                    print("Debug: error signing user up \(error.localizedDescription)")
                    return
                }
                
                guard let uid = result?.user.uid else { return }
                
                let data = ["email": credentials.email,
                            "fullname": credentials.fullName,
                            "imageUrl": imageUrl,
                            "uid": uid,
                            "age": 18]
                
                COLLECTION_USERS.document(uid).setData(data, completion:
                    completion)
            }
        }
    }
    
}
