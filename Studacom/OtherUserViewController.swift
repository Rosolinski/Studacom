//
//  OtherUserViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 08/04/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class OtherUserViewController: UIViewController {
    
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var bioLabel: UITextView!
    
    var user: User!
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        loadUser()
        
    }
    
    func loadUser() {
        Alamofire.request("http://139.59.174.112/api/users.json").response { [unowned self] response in
            
            guard let data = response.data else { return }
            
            let json = JSON(data: data)
            
            for userData in json["data"].arrayValue {
                let user = User(json: userData)
                self.users.append(user)
            }
    }
        userLabel.text = "\(user.user_name!)"
        emailLabel.text = "\(user.email!)"
        bioLabel.text = "\(user.bio!)"
        
        print(user.user_name)
        print(user.phone)
        
//        loadImages()
    }
    
    @IBAction func dismissCurrentVC(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    }

}
