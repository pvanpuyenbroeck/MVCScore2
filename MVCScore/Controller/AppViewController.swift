//
//  AppViewController.swift
//  MVCScore
//
//  Created by Pieter on 19/11/17.
//  Copyright © 2017 The White Russians. All rights reserved.
//

import UIKit
import Firebase


class AppViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var TableViewTeams: UITableView!
    var teams : [Team] = [Team]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCellTableViewCell", for: indexPath) as! TeamCellTableViewCell
        
        cell.TeamNameCell.text = "The White Russians"
        
        return cell
    }
    
    
    
    let defaultStore = Firestore.firestore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Delegate instellen als self
        TableViewTeams.delegate = self
        TableViewTeams.dataSource = self
        getMessages()
        // Do any additional setup after loading the view.
        
        //TODO: Register your TableViewTeams file here:
        TableViewTeams.register(UINib(nibName:"TeamCellTableViewCell", bundle:nil), forCellReuseIdentifier: "TeamCellTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getMessages(){
        let teamRef = defaultStore.collection("Team")
        
        defaultStore.collection("Team").getDocuments(){(querySnapshot, error) in
            if let error = error{
                print(error)
            }
            else{
                for document in querySnapshot!.documents{
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    //    @IBAction func AddCollectionClicked(_ sender: Any) {
    //        var ref: DocumentReference? = nil
    //        ref = defaultStore.collection("users").addDocument(data: [
    //            "first": "Pieter",
    //            "last": "Van Puyenbroeck",
    //            "born": "1987"]){
    //                err in
    //                if let err = err{
    //                    print("Error adding document: \(err)")
    //
    //                }
    //                else{
    //                    print("Document added with ID: \(ref!.documentID)")
    //                }
    //        }
    //    }
    
}
