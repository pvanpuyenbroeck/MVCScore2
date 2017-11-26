//
//  AppViewController.swift
//  MVCScore
//
//  Created by Pieter on 19/11/17.
//  Copyright © 2017 The White Russians. All rights reserved.
//

import UIKit
import Firebase


class AppViewController: UIViewController {
    
    @IBOutlet weak var addCollectionButton: UIButton!
    
    let defaultStore = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCollectionButton.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddCollectionClicked(_ sender: Any) {
        var ref: DocumentReference? = nil
        ref = defaultStore.collection("users").addDocument(data: [
            "first": "Pieter",
            "last": "Van Puyenbroeck",
            "born": "1987"]){
                err in
                if let err = err{
                    print("Error adding document: \(err)")
                    
                }
                else{
                    print("Document added with ID: \(ref!.documentID)")
                }
        }
    }
    
}
