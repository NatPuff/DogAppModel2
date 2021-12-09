//
//  UploadImage.swift
//  DogAppModel2
//
//  Created by Cesar Pacheco on 12/8/21.
//

import SwiftUI
import Firebase

func UploadImage(imageData: Data, path: String, completion: @escaping (String) -> ()){
    
    let storage = Storage.storage().reference()
    let uid = Auth.auth().currentUser!.uid
    
    storage.child(path).child(uid).putData(imageData, metadata: nil) { (_, err) in
        
        if err != nil {
            completion("")
            return
            
        }
        
        storage.child(path).child(uid).downloadURL { (url, err) in
            if err != nil{return}
            
            completion("\(url!)")
        }
    }
}
