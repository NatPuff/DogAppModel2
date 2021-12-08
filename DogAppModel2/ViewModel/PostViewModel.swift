////
////  PostViewModel.swift
////  DogAppModel2
////
////  Created by Cesar Pacheco on 12/7/21.
////
//
//import SwiftUI
//import Firebase
//
//class PostViewModel : ObservableObject {
//    @Published var posts : [PostModel] = []
//    let ref = Firebase.Firestore()
//
//    init() {
//       getAllPosts()
//    }
//    func getAllPosts() {
//
//        ref.collection("Posts").addSnapshotListener { (snap, err) in
//            guard let docs = snap else {return}
//
//            docs.documentChanges.forEach {(doc) in
//                if doc.type == .added{
//
//
//                    let title = doc.document.data()["title"] as! String
//                    let time = doc.document.data()["timr"] as! Timestamp
//                    let pic = doc.document.data()["title"] as! String
//
//                    for post in self.posts{
//
//                    }
//
//                }
//            }
//        }
//
//    }
//}
