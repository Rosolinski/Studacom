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

class SearchUserResultsViewController: UIViewController, UITableViewDelegate {
    
    var users = [User]()
    
    @IBOutlet var tableView: UITableView!
    var refreshAlert: UIAlertController?
    
    let cellReuseIdentifier = "cell"
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User offers"
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        self.tableView.reloadData()
        tableView.delegate = self
        loadUser()
        
    }
    
    func loadUser() {
        Alamofire.request("http://139.59.174.112/api/users.json").response { [unowned self] response in
            
            guard let data = response.data else { return }
            
            let json = JSON(data: data)
            
            for userData in json["data"].arrayValue {
                let user = User(json: userData)
            }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: String) -> String {
        return self.user.id
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        cell.textLabel!.text = "\(user.id)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell number \(indexPath.row) tapped.")
        }
    }

}
