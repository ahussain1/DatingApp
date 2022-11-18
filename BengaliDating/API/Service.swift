//
//  Service.swift
//  BengaliDating
//
//  Created by Arif  on 11/17/22.
//

import Foundation
import Firebase

struct Service {
    
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
