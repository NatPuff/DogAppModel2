//
//  RegisterViewModel.swift
//  DogAppModel2
//
//  Created by Cesar Pacheco on 12/8/21.
//

import SwiftUI
import Firebase

class RegisterViewModel : ObservableObject {
    @Published var name = ""
    @Published var bio = ""
    
    @Published var image_Data = Data(count: 0)
    @Published var picker = false
    
    func register(){
        
    }
}
