//
//  LoginViewController.swift
//  MVCScore
//
//  Created by Pieter on 19/11/17.
//  Copyright © 2017 The White Russians. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginViewController: UIViewController {

    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAuth(_ sender: Any) {
        let alertFail = UIAlertController(title: "Authentication failed", message: "Wrong credentials", preferredStyle: .alert)
        Auth.auth().signIn(withEmail: EmailText.text!, password: Password.text!) { (user, error) in
            if error != nil {
                self.present(alertFail, animated: true, completion: nil)
            }else{
                print("Login Succesfull")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "GoToApp", sender: self)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
