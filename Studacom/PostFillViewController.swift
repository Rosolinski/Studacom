//
//  PostFillViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 01/05/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class PostFillViewController: UIViewController, UITextFieldDelegate {
 
//    Accommodation Data Fields
    
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var textView: UITextView!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet var postCodeTextField: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    var accommodation: Accommodation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Details"
        self.hideKeyboardWhenTappedAround()
        titleTextField.delegate = self
        priceTextField.delegate = self
        postCodeTextField.delegate = self
        
    }
    
    @IBAction func goToConfirmAccommodationVCBtnTapped(_ sender: Any) {
        
        guard let textField = titleTextField.text else { return}
        
        guard textField.characters.count > 0 else {
            
            print("Please fill in the textfields")
            
            return
        }
        
        self.performSegue(withIdentifier: "goToConfirmSegue", sender: nil)
        
        let parameters: Parameters = [
            "accommodation_type": titleTextField.text!,
            "price": priceTextField.text!,
            "post_code": postCodeTextField.text!,
            "description": textView.text!
        ]
        
        Alamofire.request("http://139.59.174.112/api/accommodations.json", method: .post, parameters: parameters, encoding: JSONEncoding.default).response { response in
            
        }
    }
        
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PostConfirm")
//        present(vc, animated: true, completion: nil)
              
    }

