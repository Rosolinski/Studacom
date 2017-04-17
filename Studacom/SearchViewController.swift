//
//  SearchViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 23/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
        self.hideKeyboardWhenTappedAround() 
    
    }
    @IBAction func goToResultsVCBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goToResultsSegue", sender: self)
    }
}
