//
//  PostViewModel.swift
//  DogAppModel2
//
//  Created by Cesar Pacheco on 12/7/21.
//

import SwiftUI
import Firebase
import CoreMedia
import simd

class PostViewModel : ObservableObject {
    @Published var posts : [PostModel] = []
    @Published var noPosts = false
    @Published var newPost = false
    let ref = Firestore.firestore()

    init() {
       getAllPosts()
    }
    func getAllPosts() {

        ref.collection("Posts").addSnapshotListener { (snap, err) in
            guard let docs = snap else {
                
                self.noPosts = true
                return
                
            }
            if docs.documentChanges.isEmpty{
                self.noPosts = true
                return
            }
            docs.documentChanges.forEach {(doc) in
                if doc.type == .added{


                    let title = doc.document.data()["title"] as! String
                    let time = doc.document.data()["time"] as! Timestamp
                    let pic = doc.document.data()["url"] as! String
                    let userRef = doc.document.data()["ref"] as! DocumentReference

                    fetchUser(uid: userRef.documentID) { (user) in
                        self.posts.append(PostModel(id: doc.document.documentID, title: title, pic: pic, time: time.dateValue(), user: user))
                        
                        self.posts.sort { (p1, p2) -> Bool in
                            return p1.time > p2.time
                        }
                    }

                }
            }
        }

    }
}
