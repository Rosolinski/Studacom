//
//  UserAccommodation.swift
//  Studacom
//
//  Created by Robin Osolinski on 27/05/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserAccommodation {
    
    var id: String!
    var user_id: String!
    var accommodation_id: String!
    
    init(json: JSON) {
        
        id = json["id"].stringValue
        user_id = json["user_id"].stringValue
        accommodation_id = json["accommodation_id"].stringValue
        
    }
    
    
}

