//
//  FavouritesViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 23/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit

class FavouritesViewController: UIViewController {
    
    var favourites = [Accommodation]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favourites"
    }
}
