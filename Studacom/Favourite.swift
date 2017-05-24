//
//  Favourite.swift
//  Studacom
//
//  Created by Robin Osolinski on 10/05/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreLocation

class Favourite {
    
    var id: String!
    var user_id: String!
    var accommodation_id: String!
    
    init(json: JSON) {
        
        id = json["id"].stringValue
        user_id = json["bio"].stringValue
        accommodation_id = json["bio"].stringValue
    }
    
}
