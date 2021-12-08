//
//  PostModel.swift
//  DogAppModel2
//
//  Created by Cesar Pacheco on 12/7/21.
//

import SwiftUI
import Firebase

struct PostModel : Identifiable {
    var id: String
    var title: String
    var pic: String
    var time: Date
}
