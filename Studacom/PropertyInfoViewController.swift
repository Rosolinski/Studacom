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
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var typeLabel: UILabel!
    var accommodation: Accommodation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(accommodation.id!)"
        priceLabel.text = "£\(accommodation.price!)pcm"
        typeLabel.text = "\(accommodation.accommodation_type!)"
        
        print(accommodation.description)
        print(accommodation.coordinate)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSecondVC" {
            let vc = segue.destination as! PropertyInfoSecondViewController
            vc.accommodation = accommodation
        }
    }

    @IBAction func goToSecondVCBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "segueToSecondVC", sender: self)
    }

}





