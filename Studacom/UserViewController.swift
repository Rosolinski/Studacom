//
//  UserViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 30/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit

class UserViewController: UIViewController {
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Account"
        self.hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func goToFavouritesVCBtnTapped(_ sender: Any) {
            performSegue(withIdentifier: "favouriteSegue", sender: self)
    }
    
}
