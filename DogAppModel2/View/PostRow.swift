//
//  PostRow.swift
//  DogAppModel2
//
//  Created by Cesar Pacheco on 12/9/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostRow: View {
    
    var post: PostModel
    
    var body: some View {
       
        VStack(spacing: 15){
            
            HStack(spacing: 10) {
                WebImage(url: URL(string: post.user.pic)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Text(post.user.username)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Spacer(minLength: 0)
                
                Menu(content: {}, label : {
                    
                    Text("Edit")
                    
                    Text("Delete")
                    
                    Image("menu")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.white)
                    
                })
                
            }
            
            if post.pic != "" {
                WebImage(url: URL(string: post.pic)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 60, height: 250)
                    .cornerRadius(15)
            }
            HStack{
                Text(post.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
                
            }
            .padding(.top, 5)
            
            HStack{
                
                Spacer(minLength: 0)
                Text(post.time, style: .time)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
               
            }
            
        }
        .padding()
        .background(Color("bg"))
        
        .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
    }
}


