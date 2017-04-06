//
//  Accommodation.swift
//  Studacom
//
//  Created by Robin Osolinski on 24/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreLocation


class Accommodation {
    
    var description: String!
    var price: Double!
    var coordinate: CLLocationCoordinate2D!
    var id: String!
    var accommodation_type: String!
    
    init(json: JSON) {
        
        description = json["description"].stringValue
        price = json["price"].doubleValue
        coordinate = CLLocationCoordinate2D(latitude: json["lat"].doubleValue, longitude: json["lng"].doubleValue)
        id = json["id"].stringValue
        accommodation_type = json["accommodation_type"].stringValue
        
    }
    
    
}
