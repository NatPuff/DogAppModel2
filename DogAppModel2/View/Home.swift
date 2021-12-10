//
//  Home.swift
//  DogAppModel2
//
//  Created by Cesar Pacheco on 12/8/21.
//

import SwiftUI

struct Home: View {
    
    @State var selectedtab = "Posts"
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
              PostView()
                    
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
            
    }
}

