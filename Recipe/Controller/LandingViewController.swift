//
//  LandingViewController.swift
//  Recipe
//
//  Created by Haniyeh Nobakht Niaragh on 5/25/20.
//  Copyright © 2020 Haniyeh Nobakht Niaragh. All rights reserved.
//

import UIKit
//import FirebaseDatabase
import Firebase


class LandingViewController: UIViewController {
    
    

    
    
    
//    var ref: DatabaseReference! = Database.database().reference()

    @IBOutlet weak var emailTextfieldSignin: UITextField!
    @IBOutlet weak var passwordTextfieldSignin: UITextField!
    
    @IBAction func signinPressed(_ sender: Any) {
        if let email = emailTextfieldSignin.text, let password = passwordTextfieldSignin.text {
            Auth.auth().signIn(withEmail: email , password: password ) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    self.performSegue(withIdentifier: "signinSuccessful", sender: self)
                }
            }
        }
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "signUpSegue", sender: self)
    }
    
}
