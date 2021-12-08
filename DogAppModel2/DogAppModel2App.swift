//
//  DogAppModel2App.swift
//  DogAppModel2
//
//  Created by Cesar Pacheco on 12/6/21.
//

import SwiftUI
import Firebase

@main
struct DogAppModel2App: App {
    @UIApplicationDelegateAdaptor(Appdelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            Login()
                .onOpenURL(perform: {
                    url in
                    Auth.auth().canHandle(url)
                })
        }
    }
}

class Appdelegate : NSObject, UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool{
        FirebaseApp.configure()
        return true
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
    }
}
