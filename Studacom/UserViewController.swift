//
//  UserViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 30/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit

class UserViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var user: User!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func importImage(_ sender: Any) {
        
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            myImageView.image = image
        }
        else
        {
            //Error Message
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Account"
        self.hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func goToOffersVCBtnTapped(_ sender: Any) {
            performSegue(withIdentifier: "offerSegue", sender: self)
    }
    
    @IBAction func goToFavouritesVCBtnTapped(_ sender: Any) {
            performSegue(withIdentifier: "favouriteSegue", sender: self)
    }
    
    @IBAction func goToMapSegueVCBtnTapped(_ sender: Any) {
            performSegue(withIdentifier: "goToMapSegue", sender: self)
    }
    
    @IBAction func goToSearchSegueVCBtnTapped(_ sender: Any) {
            performSegue(withIdentifier: "goToSearchSegue", sender: self)
    }
    
    @IBAction func goToPostSegueVCBtnTapped(_ sender: Any) {
            performSegue(withIdentifier: "goToPostSegue", sender: self)
    }
    
    @IBAction func goToHelpVCBtnTapped(_ sender: Any) {
            performSegue(withIdentifier: "goToHelpSegue", sender: self)
    }
    
}
