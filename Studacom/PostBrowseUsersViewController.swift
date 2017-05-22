//
//  PostBrowseUsersViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 21/05/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class PostBrowseUsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var refreshAlert: UIAlertController?
    let cellReuseIdentifier = "cell"
    
    var user: User!
    let users: [String] = ["EdgeLord1991", "Zero119", "NightPanda66", "WildCat650", "Panderman", "ZooZoo92", "Miahay12", "EddyJay92", "Ricardo66", "GranthamG", "MGC", "SecretaMento1", "Varcher1991", "Milly72", "AdamScott90"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Browse Offers"
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
    
    @IBAction func goHomeVCSecondVCBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "homeFromUserSegue", sender: self)
    }
    
    @IBAction func goToBrowseAccommodationsSegue(_ sender: Any) {
        performSegue(withIdentifier: "browseAccommodationsSegue", sender: self)
}
}
