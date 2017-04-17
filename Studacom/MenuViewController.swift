//
//  ViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 22/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import UIKit
import MapKit
import Foundation
import CoreLocation


class MenuViewController: UIViewController {
    
    @IBOutlet var mainScrollView: UIScrollView!
    
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Welcome to Studacom"
        
        mainScrollView.frame = view.frame
        
        imageArray = [#imageLiteral(resourceName: "StudacomMenu1"), #imageLiteral(resourceName: "StudacomMenu2"), #imageLiteral(resourceName: "StudacomMenu3"),#imageLiteral(resourceName: "StudacomMenu4"), #imageLiteral(resourceName: "StudacomMenu1b"), #imageLiteral(resourceName: "StudacomMenu2"), #imageLiteral(resourceName: "StudacomMenu3"), #imageLiteral(resourceName: "StudacomMenu4"), #imageLiteral(resourceName: "StudacomMenu1b"), #imageLiteral(resourceName: "StudacomMenu2"), #imageLiteral(resourceName: "StudacomMenu3"), #imageLiteral(resourceName: "StudacomMenu4"), #imageLiteral(resourceName: "StudacomMenu1b"), #imageLiteral(resourceName: "StudacomMenu2"), #imageLiteral(resourceName: "StudacomMenu3"), #imageLiteral(resourceName: "StudacomMenu4b")]
        
        for i in 0..<imageArray.count{
        
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            imageView.contentMode = .scaleAspectFit
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: -140, width: self.mainScrollView.frame.width, height: self.mainScrollView.frame.height)
            
            mainScrollView.contentSize.width = mainScrollView.frame.width * CGFloat(i + 1)
            mainScrollView.addSubview(imageView)
        }
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
    }

}
