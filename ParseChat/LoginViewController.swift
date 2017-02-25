//
//  ViewController.swift
//  ParseChat
//
//  Created by Alex Chen on 2/22/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignUpButton(_ sender: Any) {
        let user = PFUser()
        user.username = emailTextField.text!
        user.password = passwordTextField.text!
        
        user.signUpInBackground {
            (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
                let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                // create a cancel action
                let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                }
                // add the cancel action to the alertController
                alertController.addAction(cancelAction)

                self.present(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                // Show the errorString somewhere and let the user try again.
            } else {
                print("Signed up")
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            }
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error:Error?) in
            if user != nil {
                print("Logged in")
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            } else {
                let alertController = UIAlertController(title: "Error", message: "Incorrect username or password.", preferredStyle: .alert)
                // create a cancel action
                let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                }
                // add the cancel action to the alertController
                alertController.addAction(cancelAction)
                
                self.present(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            }
        }
    }
}

