//
//  PostConfirmUserViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 01/05/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit

class PostConfirmUserViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Confirm Post"
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func homeVCBtnTapped(_ sender: Any) {

        let alertController = UIAlertController (title: "Post successful", message: "Your offer is now on our database. It will be reviewed and uploaded shortly.", preferredStyle: .alert)
        
        self.present(alertController, animated: true, completion: nil)

        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
             self.performSegue(withIdentifier: "goHomeSegue", sender: self)
            
            print("User post complete");}
                alertController.addAction(OKAction)
        
    }
    
}
