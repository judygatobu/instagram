//
//  LoginViewController.swift
//  instagram
//
//  Created by Judy Gatobu on 2/23/18.
//  Copyright © 2018 Judy Gatobu. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        newUser.username = usernameField.text
        
        newUser.password = passwordField.text
        
        
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                
                
                if success {
                    print("Yay, created a user!")
                    
                    self.performSegueWithIdentifier("loginSegue", sender: nil)
                } else {
                    print
                    if error? == 202 {
                        print("Username is taken")
                        
                    }
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var usernameField: UITextField!

    @IBOutlet weak var passwordField: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        
        PFUser.logInWithUsernameInBackground(usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) -> Void in
        
        if user != nil {
            print("you're logged in!")
            self.performSegueWithIdentifier("loginSegue", sender: nil)
        }
    }
    @IBAction func onSignUp(_ sender: Any) {
    }
    let LoginUser = PFUser()
    
    
    func loginUser() {
        
        let username = usernameLabel.text ?? ""
        let password = passwordLabel.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
           
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
            }
        }
    }
}
                
                NotificationCenter.default.addObserver(forName: Notification.Name("didLogout"), object: nil, queue: OperationQueue.main) { (Notification) in
                    print("Logout notification received")
                    // TODO: Logout the User
                    // TODO: Load and show the login view controller
                }
                
              
                            // Load and show the login view controller
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let loginViewController = storyboard.instantiateViewController(withIdentifier: "PUT_YOUR_LOGIN_VC_ID_HERE")
                            self.window?.rootViewController = loginViewController
                        }
                    }
                }
    
}
