//
//  SignInViewController.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 11/24/18.
//  Copyright © 2018 Vanessa Flores. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import GoogleSignIn

class SignInViewController: UIViewController  {
    
//    let authUI = FUIAuth.defaultAuthUI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // You need to adopt a FUIAuthDelegate protocol to receive callback
//        authUI?.delegate = self as? FUIAuthDelegate
//        let providers: [FUIAuthProvider] = [
//                        FUIGoogleAuth(),
//                        ]
//        authUI?.providers = providers
//
//        checkIfUserIsSignedIn()
        
      

//        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().signIn()
        
    }
    
//    func checkIfUserIsSignedIn() {
//        if Auth.auth().currentUser != nil {
//            // user is signed in
//            
//        } else {
//            // no user signed in
//        }
//        
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
