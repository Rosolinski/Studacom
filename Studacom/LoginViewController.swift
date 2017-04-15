//
//  LoginViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 10/04/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var ScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        
        ScrollView.contentSize.height = 600
        
    }
    
    @IBAction func goToLoginVCBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goToLoginSegue", sender: self)
    }
    
    @IBAction func goToSignInVCBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goToSignInSegue", sender: self)
    }
    
    
}
