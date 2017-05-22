//
//  postBrowseViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 21/05/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class PostBrowseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var refreshAlert: UIAlertController?
    let cellReuseIdentifier = "cell"
    
    var accommodation: Accommodation!
    let accommodationList: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Browse Offers"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //tables
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.accommodationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        cell.textLabel?.text = self.accommodationList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell number \(indexPath.row) tapped.")
        
    }
    @IBAction func goHomeVCBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "homeSegue", sender: self)
    }
    
    
    @IBAction func goToBrowseUsersVCBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "browseUsersSegue", sender: self)
    }
    
}
