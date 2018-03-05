//
//  registrationViewController.swift
//  instagram
//
//  Created by Judy Gatobu on 2/23/18.
//  Copyright © 2018 Judy Gatobu. All rights reserved.
//

import UIKit

class signUpViewController: UIViewController {
    
    func SignUpUser() {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameLabel.text
        newUser.email = emailLabel.text
        newUser.password = passwordLabel.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
