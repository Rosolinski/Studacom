//
//  CommentsViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 18/04/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class CommentsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Comments"
        self.hideKeyboardWhenTappedAround()
    }
}

