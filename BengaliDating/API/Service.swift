//
//  Service.swift
//  BengaliDating
//
//  Created by Arif  on 11/17/22.
//

import Foundation
import Firebase

struct Service {
    
    static func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        COLLECTION_USERS.document(uid).getDocument { (snapshot, error) in
            print("Debug: Snapchot \(snapshot?.data())")
            guard let dictionary = snapshot?.data() else { return }
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }
    
    func fetchUsers(completion: @escaping([Users]) -> Void) {
        
    }
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/images/\(filename))")
        
        ref.putData(imageData) { (metadata, error) in
            if let error = error {
                print("Debug: Error uploading image \(error.localizedDescription)")
                return
            }
        
        
            ref.downloadURL { (url, error) in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
