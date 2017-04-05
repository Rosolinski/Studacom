//
//  PropertyInfoViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 27/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreLocation
import Alamofire
import SwiftyJSON

class PropertyInfoViewController: UIViewController {
    
    var accommodation: Accommodation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(accommodation.id)"
        
        print(accommodation.description)
        print(accommodation.coordinate)
        
    }

    @IBAction func goToSecondVCBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "segueToSecondVC", sender: self)
    }

}





