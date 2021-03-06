//
//  ViewController.swift
//  Recipe
//
//  Created by Haniyeh Nobakht Niaragh on 5/25/20.
//  Copyright © 2020 Haniyeh Nobakht Niaragh. All rights reserved.
//

import UIKit
//import FirebaseDatabase
//import RealmSwift
import Firebase

class SignUpViewController: UIViewController {
    
    //    var ref: DatabaseReference! = Database.database().reference()
    
    
    @IBOutlet weak var firstNameTextfieldSU: UITextField!
    @IBOutlet weak var lastNameTextfieldSU: UITextField!
    
    @IBOutlet weak var emailTextfieldSU: UITextField!
    @IBOutlet weak var passwordTextfieldSU: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signupPressed(_ sender: Any) {
        
        // remember to add a function to check that everyfield is completed before compile later
        
        
        Auth.auth().createUser(withEmail: emailTextfieldSU.text!, password: passwordTextfieldSU.text!) { (user, error) in
            if error != nil {
                print(error!)
            } else {
                //success
                print("yeeees")
                
                let db = Firestore.firestore()
                // Add a new document with a generated ID
                db.collection("users").addDocument(data: ["firstName" : self.firstNameTextfieldSU.text!,"lastName":self.lastNameTextfieldSU.text!, "uid":user!.user.uid]) { (error) in
                    if error != nil {
                        //Creating UIAlertController and
                        //  alert user that username or pass is not in DB
                        let alertController = UIAlertController(
                            title: "INVALID INFO",
                            message: "Email and/or Password is invalid",
                            preferredStyle: .alert)
                        
                        //the cancel action doing nothing
                        let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (_) in
                        }
                        
                        alertController.addAction(cancelAction)
                        
                        //finally presenting the dialog box
                        self.present(alertController, animated: true, completion: nil) }
                    else {
                        self.performSegue(withIdentifier: "signupSuccessful", sender: self)
                        
                    }
                }
            }
        }
    }
    
    
    
    
}

