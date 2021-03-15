//
//  Hidake_BookingApp.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-10.
//

import SwiftUI
import Firebase
import GoogleSignIn


@main
struct Hidake_BookingApp: App {
    
    // Attaching App delegate to SwiftUI...
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    init () {
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        
        WindowGroup {
            //passing to man view
            EntryCV(info: self.delegate)
        }

    }
    
    
}
// To observe or read data from app delegate...




class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate, ObservableObject {
    
    @Published var email = ""
    @Published var customerUID = ""
    
    func application(_ application: UIApplication,
                       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true
      }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("YEss")
        guard let user = user else {
            print("Sign In Error: \(error.localizedDescription)")
            return}
        
        let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
        
        // Signing in to Firebase
        
        Auth.auth().signIn(with: credential) { (result, err) in
            
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            self.email = (result?.user.email)!
            self.customerUID = (result?.user.uid)!
            
            print(result?.user.email)
        }
        
        
    }
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }
}
