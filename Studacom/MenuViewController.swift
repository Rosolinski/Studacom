//
//  ViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 22/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import UIKit
import MapKit
import Foundation
import CoreLocation


class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Welcome to Studacom"
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
    }

}
