//
//  PostViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 23/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Post Offer"
    }
    
    @IBAction func goToFirstPropertyVCBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goToFirstPropertySegue", sender: self)
    }
    
    @IBAction func goToSecondPropertyVCBtnTapped(_ sender: Any) {
    performSegue(withIdentifier: "goToSecondPropertySegue", sender: self)
    }
    
    @IBAction func goToBrowseBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToBrowseSegue", sender: self)
    }
}
