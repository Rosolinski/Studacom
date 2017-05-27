//
//  PostConfirmViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 01/05/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit
import PCLBlurEffectAlert

class PostConfirmViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate  {
    
    @IBOutlet weak var myPropertyImageView: UIImageView!
    
    @IBAction func importPropertyImage(_ sender: Any) {
        
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            myPropertyImageView.image = image
        }
        else
        {
            //Error Message
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Confirm Post"
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func homeCheckVCBtnTapped(_ sender: AnyObject) {
        
        let alert = PCLBlurEffectAlert.Controller(title: "Post successful", message: "Your offer is now on our database. It will be reviewed and uploaded shortly.", effect: UIBlurEffect(style: .dark) , style: .alert)
        let alertBtn = PCLBlurEffectAlert.Action(title: "OK", style: .default, handler: nil)
            self.performSegue(withIdentifier: "goHomeSegue", sender: self)
        alert.addAction(alertBtn)
        
        alert.configure(cornerRadius: 20)
        alert.configure(overlayBackgroundColor: UIColor(red: 40, green: 20, blue: 250, alpha: 0.0009))
        alert.configure(titleFont: UIFont.systemFont(ofSize: 30), titleColor: UIColor.white)
        alert.configure(messageFont: UIFont.systemFont(ofSize: 15), messageColor: UIColor.white)
        
        alert.show()
        
        self.performSegue(withIdentifier: "goHomeSegue", sender: nil)
            print("Accommodation post complete");}
        
    }

