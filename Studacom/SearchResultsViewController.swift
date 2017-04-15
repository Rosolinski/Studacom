//
//  SearchResultsViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 31/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let accommodations: [String] = ["House 1", "House 2", "House 3", "House 4", "House 5", "House 6", "House 7", "House 8", "House 9", "House 10"]
    
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var tableView: UITableView!

        var accommodation: Accommodation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.accommodations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!

        cell.textLabel?.text = self.accommodations[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell number \(indexPath.row) tapped.")
    }
}

