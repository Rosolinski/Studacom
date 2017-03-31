//
//  PropertyInfoSecondViewController.swift
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

class PropertyInfoSecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Schedule a Meeting"
    }
    
    @IBAction func goToThirdVCBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "segueToThirdVC", sender: self)
        
    }
    
    
}
