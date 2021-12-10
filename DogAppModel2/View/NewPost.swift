//
//  CreatePost.swift
//  DogAppModel2
//
//  Created by Cesar Pacheco on 12/9/21.
//

import SwiftUI

struct NewPost: View {
    @StateObject var newPostData = NewPostModel()
    @Environment(\.presentationMode) var present
    var body: some View {
        VStack{
            HStack(spacing: 15){
                Button(action: {present.wrappedValue.dismiss()}) {
                    Text("Cancel")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                Spacer(minLength: 0)
                Button(action: {newPostData.picker.toggle()}){
                    Image(systemName: "photo.fill")
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                Button(action: {newPostData.post(present: present)}){
                    Text("Post")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(.blue)
                        .clipShape(Capsule())
                }
            }
            .padding()
            .opacity(newPostData.isPosting ? 0.5 : 1)
            .disabled(newPostData.isPosting ? true : false)
            
            TextEditor(text: $newPostData.postTxt)
                .cornerRadius(15)
                .padding()
                .opacity(newPostData.isPosting ? 0.5 : 1)
                .disabled(newPostData.isPosting ? true : false)
                
            
            if newPostData.img_Data.count != 0{
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                Image(uiImage: UIImage(data: newPostData.img_Data)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width / 2, height: 150)
                    .cornerRadius(15)
                    
                    Button(action: {newPostData.img_Data = Data(count: 0)}) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.blue)
                            .clipShape(Circle())
                    }
                }
                .padding()
                .opacity(newPostData.isPosting ? 0.5 : 1)
                .disabled(newPostData.isPosting ? true : false)
                
            }
            
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $newPostData.picker) {
            ImagePicker(picker: $newPostData.picker, img_Data :$newPostData.img_Data)
        }
    }
}


