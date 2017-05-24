//
//  FavouritesViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 23/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class FavouritesViewController: UITableViewController {
    
    var refreshAlert: UIAlertController?
    let cellReuseIdentifier = "cell"
    
    var favourite: Favourite!
    var favourites = [Favourite]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favourites"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadFavourite()
    }
    
    func loadFavourite() {
        Alamofire.request("http://139.59.174.112/api/favourites.json").response { [unowned self] response in
            
            guard let data = response.data else { return }
            
            let json = JSON(data: data)
            
            for favouriteData in json["data"].arrayValue {
                let favourite = Favourite(json: favouriteData)
                self.favourites.append(favourite)
            }
            
            self.tableView.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favourites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        let favourite = favourites[indexPath.row]
        
        cell.textLabel?.text = favourite.accommodation_id
        
        return cell
    }
}
