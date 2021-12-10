//
//  NewPostModel.swift
//  DogAppModel2
//
//  Created by Cesar Pacheco on 12/9/21.
//




import SwiftUI
import Firebase
import simd

class NewPostModel : ObservableObject{
    @Published var postTxt = ""
    
    @Published var picker = false
    @Published var img_Data = Data(count: 0)
    
    @Published var isPosting = false
    
    let uid = Auth.auth().currentUser!.uid
    
    func post(present : Binding<PresentationMode>){
        isPosting = true
        
        if img_Data.count == 0{
            ref.collection("Posts").document().setData([
                "title" : self.postTxt,
                "url": "",
                "ref": ref.collection("Users").document(self.uid),
                "time": Date()
            ]) { (err) in
                if err != nil{
                    self.isPosting = false
                    return
                }
                self.isPosting = false
                
                present.wrappedValue.dismiss()
            }
        }
        else {
            UploadImage(imageData: img_Data, path: "post_Pics") {(url) in
                ref.collection("Posts").document().setData([
                    "title" : self.postTxt,
                    "url": url,
                    "ref": ref.collection("Users").document(self.uid),
                    "time": Date()
                ]) { (err) in
                    if err != nil{
                        self.isPosting = false
                        return
                    }
                    self.isPosting = false
                    
                    present.wrappedValue.dismiss()
                }
            }
        }
    }
}
