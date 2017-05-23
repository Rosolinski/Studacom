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

class PostBrowseUsersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var refreshAlert: UIAlertController?
    let cellReuseIdentifier = "cell"
    
    var user: User!
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Browse Offers"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadUser()
        
    }
    
    func loadUser() {
        Alamofire.request("http://139.59.174.112/api/users.json").response { [unowned self] response in
            
            guard let data = response.data else { return }
            
            let json = JSON(data: data)
            
            for userData in json["data"].arrayValue {
                let user = User(json: userData)
                self.users.append(user)
            }
            
            self.tableView.reloadData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "otherUserSegue" {
            let vc = segue.destination as! OtherUserViewController
            vc.user = sender as! User
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.user_name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell number \(indexPath.row) tapped.")
        
        let user = users[indexPath.row]
        
        performSegue(withIdentifier: "otherUserSegue", sender: user)
    }
    @IBAction func goHomeVCSecondVCBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "homeFromUserSegue", sender: self)
    }
    
    @IBAction func goToBrowseAccommodationsSegue(_ sender: Any) {
        performSegue(withIdentifier: "browseAccommodationsSegue", sender: self)
    }
}
