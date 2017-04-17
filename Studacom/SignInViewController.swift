//
//  SignInViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 17/04/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class SignInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create an account"
        self.hideKeyboardWhenTappedAround() 
    }
}
