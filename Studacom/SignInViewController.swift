//
//  SignInViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 26/05/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

// Be sure to simulate Studacom on iPhone 5 for the best results

import UIKit
import Foundation
import PCLBlurEffectAlert

class SignInViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    
    @IBOutlet var websiteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sign in to Studacom"
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        textField.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onClickLabel(sender:)))
        websiteLabel.isUserInteractionEnabled = true
        websiteLabel.addGestureRecognizer(tap)
    }
    
    func onClickLabel(sender:UITapGestureRecognizer) {
        openUrl(urlString: "http://studacom.co.uk")
    }
    
    func openUrl(urlString:String!) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func signInBtn(_ sender: Any) {
        
        guard let titleTextField = textField.text else { return}
        
        guard titleTextField.characters.count > 7 else {
            
            let alert = PCLBlurEffectAlert.Controller(title: "Authentication Failed", message: "Please enter a valid username and password to proceed", effect: UIBlurEffect(style: .dark) , style: .alert)
            let alertBtn = PCLBlurEffectAlert.Action(title: "OK", style: .default, handler: nil)
            
            alert.addAction(alertBtn)
            
            alert.configure(cornerRadius: 20)
            alert.configure(overlayBackgroundColor: UIColor(red: 40, green: 20, blue: 250, alpha: 0.0009))
            alert.configure(titleFont: UIFont.systemFont(ofSize: 30), titleColor: UIColor.white)
            alert.configure(messageFont: UIFont.systemFont(ofSize: 15), messageColor: UIColor.white)
            
            alert.show()
            return
                
        }
        
        performSegue(withIdentifier: "startUpSegue", sender: self)
    }
}
