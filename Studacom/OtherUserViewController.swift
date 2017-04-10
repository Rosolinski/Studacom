//
//  OtherUserViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 08/04/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit

class OtherUserViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        
    }
    
    @IBAction func dismissCurrentVC(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    }

}
