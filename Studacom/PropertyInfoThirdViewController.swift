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
    
    @IBOutlet var userLabel: UILabel!
    
    @IBOutlet var emailLabel: UILabel!
    
    @IBOutlet var phoneLabel: UILabel!
    
    @IBOutlet var bioLabel: UITextView!
    
    var accommodation: Accommodation!
    var accommodations = [Accommodation]()
    
    var userAccommodation: UserAccommodation!
    var userAccommodations = [UserAccommodation]()
    
    var user: User!
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        loadUser()
    }
    
    func loadUser() {
        Alamofire.request("http://139.59.174.112/api/accommodations.json").response { [unowned self] response in
            
            guard let data = response.data else { return }
            
            let json = JSON(data: data)
            
            for userData in json["data"].arrayValue {
                let user = User(json: userData)
                self.users.append(user)
            }
        }

        userLabel.text = "\(accommodation.user!)"
        emailLabel.text = "\(accommodation.email!)"
        phoneLabel.text = "\(accommodation.phone!)"
        bioLabel.text = "\(accommodation.bio!)"

    }

    @IBAction func dismissCurrentVC(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
}
