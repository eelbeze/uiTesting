//
//  LoginViewController.swift
//  uiTesting
//
//  Created by Elise El beze on 07/11/2018.
//  Copyright © 2018 Elise El beze. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //  MARK: - Properties
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    private let validUsername = "username"
    private let validPassword = "password"
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Action
    
    @IBAction func loginTouch(_ sender: Any) {
        activityIndicator.startAnimating()
        loginButton.setTitle("", for: .normal)
        
        guard usernameTextField.text == validUsername &&
            passwordTextField.text == validPassword else {
                activityIndicator.stopAnimating()
                loginButton.setTitle("Login", for: .normal)
                errorLabel.isHidden = false
                return
        }
        errorLabel.isHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.activityIndicator.stopAnimating()
            self.performSegue(withIdentifier: AppTableViewController.segueIdentifier, sender: nil)
        }
    }
}
