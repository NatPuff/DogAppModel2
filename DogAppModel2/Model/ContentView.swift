//
//  ContentView.swift
//  DogAppModel2
//
//  Created by Cesar Pacheco on 12/6/21.
//

import SwiftUI




struct ContentView: View {
    @AppStorage("curren_status") var status = false
    var body: some View {
        NavigationView{
            VStack{
                if status{Home()}
                else{Login()}
            }
           
                .navigationBarHidden(true)
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
