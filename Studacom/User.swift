//
//  User.swift
//  Studacom
//
//  Created by Robin Osolinski on 24/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreLocation


class User {
    
    var user_name: String!
    var phone: String!
    var password: String!
    var email: String!
    var id: String!
    var bio: String!
    
    init(json: JSON) {
        
        user_name = json["user_name"].stringValue
        phone = json["phone"].stringValue
        password = json["password"].stringValue
        email = json["email"].stringValue
        id = json["id"].stringValue
        bio = json["bio"].stringValue
    }
    
    
}
