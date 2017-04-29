//
//  BrowseViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 19/04/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class BrowseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Current Offers"
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func goToHomeBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goHomeSegue", sender: self)
    }
    
    @IBAction func goToBrowseUsersBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goBrowseUsersSegue", sender: self)
    }
    
    @IBAction func goToBrowseAccommodationsBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goBrowseAccommodationsSegue", sender: self)
    }
    
    @IBOutlet var AccommodationTableView: UITableView!
    
    @IBOutlet var UserTableView: UITableView!
}
