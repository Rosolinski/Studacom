//
//  PropertyInfoThirdViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 28/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreLocation
import Alamofire
import SwiftyJSON

class PropertyInfoThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
    }
    
    @IBAction func dismissCurrentVC(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
}
