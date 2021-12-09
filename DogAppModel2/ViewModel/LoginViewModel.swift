//
//  LoginViewModel.swift
//  DogAppModel2
//
//  Created by Cesar Pacheco on 12/7/21.
//

import SwiftUI
import Firebase
class LoginViewModel : ObservableObject{
    @Published var code = ""
    @Published var number = ""
    
    @Published var errorMsg = ""
    @Published var error = false
    
    @Published var registerUser = false
    @AppStorage("current_Status") var status = false
    
    @Published var isLoading = false
    
    
    
    func verifyUser(){
        isLoading = true
        
        
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
        
        let phoneNumber = "+" + code + number
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) {
            (ID, err) in
             if err != nil {
                self.errorMsg = err!.localizedDescription
                self.error.toggle()
                 self.isLoading = false
                return
            }
            
            self.alertView { (Code) in
                let credentials = PhoneAuthProvider.provider().credential(withVerificationID: ID!, verificationCode: Code)
                Auth.auth().signIn(with: credentials) { (res, err) in
                    if err != nil {
                        self.errorMsg = err!.localizedDescription
                        self.error.toggle()
                        self.isLoading = false
                        return
                    }
                    self.checkUser()
                }
            }
            
        }
    }
    func alertView(completion: @escaping (String) -> ()){
        let alert = UIAlertController(title: "Verification", message: "Enter Code", preferredStyle: .alert)
        
        alert.addTextField { (txt) in
            txt.placeholder = "123456"
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        
        alert.addAction(UIAlertAction(title: "Verify", style: .default, handler: {(_) in
            
            let code = alert.textFields![0].text ?? ""
            
            if code == "" {
                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                return
            }
            completion(code)
        }))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
    }
    
    func checkUser() {
        
        let ref = Firestore.firestore()
        let uid = Auth.auth().currentUser!.uid
        
        ref.collection("Users").whereField("uid", arrayContains: uid).getDocuments{
            (snap, err) in
            
            if err != nil{
                
                
                self.registerUser.toggle()
                self.isLoading = false
                return
            }
            if snap!.documents.isEmpty{
                
                self.registerUser.toggle()
                self.isLoading = false
                return
            }
            self.status = true
        }
    }
    
}
