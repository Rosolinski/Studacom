//
//  Comment.swift
//  Studacom
//
//  Created by Robin Osolinski on 18/04/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreLocation


class Comment {
    
    var comment: String!
    
    init(json: JSON) {
        
        comment = json["comment"].stringValue

    }
    
    
}
