//
//  PostConfirmViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 01/05/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit

class PostConfirmViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate  {
    
    @IBOutlet weak var postCodeTextView: UITextField!
    
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
    
    @IBAction func homeCheckVCBtnTapped(_ sender: Any) {
        guard let postCodeTextView = postCodeTextView.text else { return}
        
        guard postCodeTextView.characters.count > 0 else {
            
            print("Please fill in the textfield")
            
            return
        }
        
        let alertController = UIAlertController (title: "Post successful", message: "Your offer is now on our database. It will be reviewed and uploaded shortly.", preferredStyle: .alert)
        
        self.present(alertController, animated: true, completion: nil)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            self.performSegue(withIdentifier: "goHomeSegue", sender: self)
        
        self.performSegue(withIdentifier: "goHomeSegue", sender: nil)
            print("Accommodation post complete");}
        alertController.addAction(OKAction)
        
    }
    
}
