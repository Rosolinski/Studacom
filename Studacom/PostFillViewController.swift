//
//  PostFillViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 01/05/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit

class PostFillViewController: UIViewController, UITextFieldDelegate {
 
//    Accommodation Data Fields
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
//    private func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//        
//        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
//        
//        if !text.isEmpty{
//            button.isUserInteractionEnabled = false
//        } else {
//            button.isUserInteractionEnabled = true
//        }
//        
//        return true
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Details"
        self.hideKeyboardWhenTappedAround()
        textField.delegate = self
        
        //Default checking and disabling of the Button
//        if (textField.text!.isEmpty){
//            button.isUserInteractionEnabled = false // Disabling the button
//        }
        
    }
    
    @IBAction func goToConfirmAccommodationVCBtnTapped(_ sender: Any) {
        
        guard let textField = textField.text else { return}
        
        guard textField.characters.count > 0 else {
            
            print("Please fill in the textfields")
            
            return
        }
        
        self.performSegue(withIdentifier: "goToConfirmSegue", sender: nil)
        
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PostConfirm")
//        present(vc, animated: true, completion: nil)
              
    }
}
