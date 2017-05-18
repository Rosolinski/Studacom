//
//  PropertyInfoViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 27/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreLocation
import Alamofire
import SwiftyJSON

class PropertyInfoViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var typeLabel: UILabel!
    var accommodation: Accommodation!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var galleryImageView: [UIImageView]!
    
    @IBOutlet weak var secondImageView: UIImageView!
    
    @IBOutlet weak var thirdImageView: UIImageView!
    
    @IBOutlet weak var fourthImageView: UIImageView!
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Property"

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PropertyInfoViewController.imageTapped(_:)))
        let secondTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PropertyInfoViewController.secondImageTapped(_:)))
        let thirdTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PropertyInfoViewController.thirdImageTapped(_:)))
        let fourthTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PropertyInfoViewController.thirdImageTapped(_:)))
        let mainTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PropertyInfoViewController.mainImageTapped(_:)))
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        secondImageView.isUserInteractionEnabled = true
        secondImageView.addGestureRecognizer(secondTapGestureRecognizer)
        
        thirdImageView.isUserInteractionEnabled = true
        thirdImageView.addGestureRecognizer(thirdTapGestureRecognizer)
        
        fourthImageView.isUserInteractionEnabled = true
        fourthImageView.addGestureRecognizer(fourthTapGestureRecognizer)
        
        mainImageView.isUserInteractionEnabled = true
        mainImageView.addGestureRecognizer(mainTapGestureRecognizer)
        
        for imageView in galleryImageView {
            imageView.isUserInteractionEnabled = true
        }
        
        priceLabel.text = "£\(accommodation.price!) pcm"
        typeLabel.text = "\(accommodation.accommodation_type!)"
        
        print(accommodation.description)
        print(accommodation.coordinate)
        
        loadImages()
    }
    
    func loadImages() {
        imageView.imageFromServerURL(urlString: accommodation.mainImage)

        for (index, image) in accommodation.images.enumerated() {
            guard index < 4 else { return }
            galleryImageView[index].imageFromServerURL(urlString: image)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSecondVC" {
            let vc = segue.destination as! PropertyInfoSecondViewController
            vc.accommodation = accommodation
        }
    }
    
    @IBAction func showBtn(_ sender: Any) {
        
        let alertController = UIAlertController (title: "Add successful", message: "\(accommodation.accommodation_type!) added to favourites", preferredStyle: .alert)
        
        self.present(alertController, animated: true, completion: nil)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            print("Added \(self.accommodation.id!) to favourites!");
        }
        
        alertController.addAction(OKAction)
        
        }
    
    func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func secondImageTapped(_ sender: UITapGestureRecognizer) {
        let secondImageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: secondImageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func thirdImageTapped(_ sender: UITapGestureRecognizer) {
        let thirdImageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: thirdImageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func fourthImageTapped(_ sender: UITapGestureRecognizer) {
        let fourthImageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: fourthImageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func mainImageTapped(_ sender: UITapGestureRecognizer) {
        let mainImageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: mainImageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }

    @IBAction func goToSecondVCBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "segueToSecondVC", sender: self)
    }
    
    @IBAction func goToCommentsVCBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "CommentsSegue", sender: self)
        
    }

}





