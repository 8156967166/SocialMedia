//
//  ContinueWithGoogleViewController.swift
//  SocialMediaAppProject
//
//  Created by Bimal@AppStation on 06/09/22.
//

import UIKit
import GoogleSignIn

class ContinueWithGoogleViewController: UIViewController {

    let signInConfig = GIDConfiguration(clientID: "860958727992-q4r7s699dnrd3mrqh5krjts8d7361upc.apps.googleusercontent.com")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 127496664059-k7fhjaau1tphm5dic5qsdn7b75r4njld.apps.googleusercontent.com
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonActionContinueWithGoogle(sender: UIButton) {
        
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            
            guard let user = user else { return }

                let emailAddress = user.profile?.email
            
            print("emailAddress: \(emailAddress)")
        }
            
    }
    @IBAction func signOut(sender: Any) {
        
        if GIDSignIn.sharedInstance.currentUser != nil {
            GIDSignIn.sharedInstance.signOut()
        }
        
        
//        print(GIDSignIn.sharedInstance.currentUser != nil) // true - signed in
//        GIDSignIn.sharedInstance.disconnect()
//        print(GIDSignIn.sharedInstance.currentUser != nil) // true - still signed in
//
//        // MARK: - GIDSignInDelegate
//        func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
//            print(GIDSignIn.sharedInstance.currentUser != nil) // false - signed out
//
//
//            // Remove any data saved to your app obtained from Google's APIs for this user.
//        }
//
        
      
        print("Sign out completed successfully")
    }

}
