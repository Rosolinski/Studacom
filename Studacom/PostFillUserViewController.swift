//
//  PostFillUserViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 03/05/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit

class PostFillUserViewController: UIViewController, UITextFieldDelegate {
    
//    User Data Fields
    
    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Add Details"
    self.hideKeyboardWhenTappedAround()
    titleTextField.delegate = self
        
    }
    
    @IBAction func goToConfirmUserVCBtnTapped(_ sender: Any) {
        
        guard let titleTextField = titleTextField.text else { return}
        
        guard titleTextField.characters.count > 0 else {
            
            print("Please fill in the textfields")
            
            return
        }
        
        self.performSegue(withIdentifier: "goToConfirmUserSegue", sender: nil)

    }
}
