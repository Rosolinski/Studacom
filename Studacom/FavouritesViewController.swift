//
//  FavouritesViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 23/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit

class FavouritesViewController: UITableViewController {
    
    var favourites = [Accommodation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favourites"
    }
}
