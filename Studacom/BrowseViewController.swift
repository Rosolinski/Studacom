//
//  BrowseViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 19/04/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class BrowseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let users: [String] = ["EdgeLord1991", "Zero119", "NightPanda66", "WildCat650", "Panderman", "ZooZoo92", "Miahay12", "EddyJay92", "Ricardo66", "GranthamG", "MGC", "SecretaMento1", "Varcher1991", "Milly72", "AdamScott90"]
    
    @IBOutlet var userTableView: UITableView!
    var refreshAlert: UIAlertController?
    
    let cellReuseIdentifier = "cell"
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Current Offers"
        self.hideKeyboardWhenTappedAround()
        self.userTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        userTableView.delegate = self
        userTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.userTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        cell.textLabel?.text = self.users[indexPath.row]
        
        return cell
    }
    @IBAction func goToHomeBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goHomeSegue", sender: self)
    }
    
    @IBAction func goToBrowseUsersBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goBrowseUsersSegue", sender: self)
    }
    
    @IBAction func goToBrowseAccommodationsBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goBrowseAccommodationsSegue", sender: self)
    }
    
    @IBOutlet var AccommodationTableView: UITableView!

}
