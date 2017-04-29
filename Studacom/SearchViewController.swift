//
//  SearchViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 23/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
        self.hideKeyboardWhenTappedAround()
    
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
