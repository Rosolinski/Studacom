//
//  HelpViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 23/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit

class HelpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Help"
   
    }
    
    @IBAction func goToSecondHelpVCBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goToSecondHelpSegue", sender: self)
    }

    @IBAction func goToThirdHelpVCBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goToThirdHelpSegue", sender: self)
    }
    
    @IBAction func goToFourthHelpVCBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goToFourthHelpSegue", sender: self)
    }
    
    @IBAction func goToPostHelpVCBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goToFifthHelpSegue", sender: self)
    }
    
    @IBAction func goToFifthHelpVCBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goToSixthHelpSegue", sender: self)
    }
    
    }


