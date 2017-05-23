//
//  PropertyInfoSecondViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 28/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreLocation
import Alamofire
import SwiftyJSON

class PropertyInfoSecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let times: [String] = ["11:00 - 14:00            Weekdays","13:00 - 14:00            Saturday", "14:00 - 15:00            Sunday"]
    
    let cellReuseIdentifier = "cell"
    
    @IBOutlet var descText: UITextView!
    @IBOutlet weak var tableView: UITableView!

    var accommodation: Accommodation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Schedule a Meeting"
        descText.text = "\(accommodation.description!)"
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.times.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
            
            cell.textLabel?.text = self.times[indexPath.row]
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("Cell number \(indexPath.row) tapped.")
        }

    @IBAction func goToThirdVCBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "segueToThirdVC", sender: self)
    }
    
    @IBAction func dismissCurrentVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

