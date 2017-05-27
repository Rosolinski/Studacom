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
    var price: String!
    var coordinate: CLLocationCoordinate2D!
    var id: String!
    var accommodation_type: String!
    var post_code: String!
    var images = [String]()
    var comments = [Comment]()
    var user_accommodations = [UserAccommodation]()
    var mainImage: String!
    var galleryImage: String!
    var user: String!
    var phone: String!
    var email: String!
    var bio: String!
    
    init(json: JSON) {
        
        description = json["description"].stringValue
        price = json["price"].stringValue
        coordinate = CLLocationCoordinate2D(latitude: json["lat"].doubleValue, longitude: json["lng"].doubleValue)
        id = json["id"].stringValue
        user = json["user"].stringValue
        phone = json["phone"].stringValue
        email = json["email"].stringValue
        bio = json["bio"].stringValue
        post_code = json["post_code"].stringValue
        accommodation_type = json["accommodation_type"].stringValue
        
        for image in json["accommodation_images"].arrayValue {
            if image["main_image"].boolValue {
                mainImage = "http://139.59.174.112/img/posts/" + image["name"].stringValue + ".jpg"
            }
            images.append("http://139.59.174.112/img/posts/" + image["name"].stringValue + ".jpg")
        }
        
        for comment in json["accommodation_comments"].arrayValue {
            comments.append(Comment(json: comment))
        }
        
        for user_accommodation in json["accommodation_user_accommodation"].arrayValue {
            user_accommodations.append(UserAccommodation(json: user_accommodation))
        }
        
        print(images)
        
    }
    
    
}
