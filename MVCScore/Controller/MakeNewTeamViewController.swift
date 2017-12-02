//
//  MakeNewTeamViewController.swift
//  MVCScore
//
//  Created by Pieter on 26/11/17.
//  Copyright © 2017 The White Russians. All rights reserved.
//

import UIKit
import Firebase

class MakeNewTeamViewController: UIViewController {
    
    @IBOutlet weak var TeamNameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    let defaultStore = Firestore.firestore()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddTeamClick(_ sender: Any) {
        let alertcontroller = UIAlertController(title: "Not possible", message: "Team name can not be empty", preferredStyle: .alert)
        let alertAddedController = UIAlertController(title: "Success" , message: "Team \(TeamNameText.text!) added", preferredStyle: .alert)
        
        alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alertAddedController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        if TeamNameText.text != ""{
            AddTeam()
            self.present(alertAddedController, animated: true, completion: {
                self.performSegue(withIdentifier: "GoToApp", sender: self)
            })
        }else{
            self.present(alertcontroller, animated: true, completion: nil)
        }
    }
    
    func AddTeam(){
        //        var TeamRef: DocumentReference? = nil
        defaultStore.collection("Team").document(self.TeamNameText.text!).setData([
            "Name": TeamNameText.text!
            
            
        ]){
            err in
            if let err = err{
                print("Error adding document: \(err)")
            }
            else{
                print("Document added with ID: \(self.TeamNameText.text)")
                self.TeamNameText.text = ""
            }
            
        }
    }
}
