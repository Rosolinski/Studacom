//
//  HelpSecondViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 30/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit

class HelpSecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
    
    }
    
    @IBAction func dismissCurrentVC(_ sender: Any) {
    dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func goToSearchVCBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goToSearchSegue", sender: self)
    }
    
    
}
