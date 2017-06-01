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
    var accommodations = [Accommodation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Browse Offers"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadAccommodation()
    }
    
    func loadAccommodation() {
        Alamofire.request("http://139.59.174.112/api/accommodations.json").response { [unowned self] response in
            
            guard let data = response.data else { return }
            
            let json = JSON(data: data)
            
            for accommodationData in json["data"].arrayValue {
                let accommodation = Accommodation(json: accommodationData)
                self.accommodations.append(accommodation)
            }
            
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "newPropertySegue" {
            let vc = segue.destination as! PropertyInfoViewController
            vc.accommodation = sender as! Accommodation
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accommodations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        let accommodation = accommodations[indexPath.row]
        
        cell.textLabel?.text = accommodation.accommodation_type
        cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size:15)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell number \(indexPath.row) tapped.")
        
        let accommodation = accommodations[indexPath.row]
        
        performSegue(withIdentifier: "newPropertySegue", sender: accommodation)
    }
    @IBAction func goHomeVCBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "homeSegue", sender: self)
    }
    
    @IBAction func goToBrowseUsersVCBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "browseUsersSegue", sender: self)
    }
}
