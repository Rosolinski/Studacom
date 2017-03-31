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
    
    init(json: JSON) {
        
        description = json["description"].stringValue
        price = json["price"].doubleValue
        coordinate = CLLocationCoordinate2D(latitude: json["lat"].doubleValue, longitude: json["lng"].doubleValue)
        
    }
    
    
}
