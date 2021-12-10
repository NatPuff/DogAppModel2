//
//  PostView.swift
//  DogAppModel2
//
//  Created by Cesar Pacheco on 12/9/21.
//

import SwiftUI

struct PostView: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var postData = PostViewModel()
    var body: some View {
        VStack{
            
            HStack{
             Text("Posts")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.white)
            Spacer(minLength: 0)
            
                Button(action: {postData.newPost.toggle()}) {
                Image(systemName: "square.and.pencil")
                    .font(.title)
                    .foregroundColor(.white)
                }
            }
            .padding()
            .padding(.top, edges!.top)
            
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            if postData.posts.isEmpty{
                Spacer(minLength: 0)
                
                if postData.noPosts{
                    Text("No Posts !!!")
                }
                else{
                    ProgressView()
                }
                Spacer(minLength: 0)
            }
            else{
                ScrollView{
                    VStack(spacing: 15){
                        ForEach(postData.posts){ post in
                            PostRow(post: post)
                        }
                    }
                    .padding()
                    .padding(.bottom, 55)
                }
            }
           
        }
        .fullScreenCover(isPresented: $postData.newPost) {
            NewPost()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
