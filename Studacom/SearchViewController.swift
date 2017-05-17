//
//  SearchViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 23/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class SearchViewController: UIViewController, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var refreshAlert: UIAlertController?
    let cellReuseIdentifier = "cell"
    
    var accommodation: Accommodation!
    
    let accommodationList: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    var accommodationFilteredList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
        self.hideKeyboardWhenTappedAround()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
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
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        //textField code
        
        textField.resignFirstResponder()  //if desired
        performAction()
        return true
        
    }
    
    func performAction() {
        
        //action events
    }
    
    @IBAction func goToResultsVCBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goToAccomResultsSegue", sender: self)
    }
    
    @IBAction func goToSecondResultsVCBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goToUserResultsSegue", sender: self)
    }
    
    @IBAction func TextFieldPrimaryActionTriggered(_ sender: Any) {
        print("Search Pressed")
        performSegue(withIdentifier: "goToResultsSegue", sender: self)
    }
    
    @IBAction func goToSearchResultsVCBtnTapped(_ sender: Any) {
        print("Search Pressed")
        performSegue(withIdentifier: "goToResultsSegue", sender: self)
    }
}
