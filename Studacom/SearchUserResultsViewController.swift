//
//  SearchUserResultsViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 23/04/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchUserResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    let users: [String] = ["EdgeLord1991", "Zero119", "NightPanther66", "WildCat650", "Panderman", "ZooZoo92", "Miahay12", "EddyJay92", "Ricardo66", "GranthamG", "MGC", "SecretaMento1", "Varcher1991", "Milly72", "AdamScott90"]
    
    @IBOutlet var tableView: UITableView!
    var refreshAlert: UIAlertController?
    
    let cellReuseIdentifier = "cell"
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Users"
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        cell.textLabel?.text = self.users[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell number \(indexPath.row) tapped.")
    }
}
