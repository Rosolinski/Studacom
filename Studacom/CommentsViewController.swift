//
//  CommentsViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 18/04/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import PCLBlurEffectAlert

class CommentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var postBtn: UIButton!
    
    var refreshAlert: UIAlertController?
    let cellReuseIdentifier = "cell"
    
    var accommodation: Accommodation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Comments"
        self.hideKeyboardWhenTappedAround()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        loadComment()
        
    }
    
//    func loadComment() {
//        Alamofire.request("http://139.59.174.112/api/accommodation_comments.json").response { [unowned self] response in
//            
//            guard let data = response.data else { return }
//            
//            let json = JSON(data: data)
//            
//            for commentData in json["data"].arrayValue {
//                let comment = Comment(json: commentData)
//                self.comments.append(comment)
//            }
//            
//            self.tableView.reloadData()
//        }
//    }
    
    @IBAction func postComment(_ sender: Any) {
    
        let alert = PCLBlurEffectAlert.Controller(title: "Comment added", message: "Please reopen the app and check this page again to see what you wrote.", effect: UIBlurEffect(style: .dark) , style: .alert)
        let alertBtn = PCLBlurEffectAlert.Action(title: "OK", style: .default, handler: nil)
        
        alert.addAction(alertBtn)
        
        alert.configure(cornerRadius: 20)
        alert.configure(overlayBackgroundColor: UIColor(red: 40, green: 20, blue: 250, alpha: 0.0009))
        alert.configure(titleFont: UIFont.systemFont(ofSize: 30), titleColor: UIColor.white)
        alert.configure(messageFont: UIFont.systemFont(ofSize: 15), messageColor: UIColor.white)
        
        print("Comment Posted");
        
        alert.show()
        
        let parameters: Parameters = [
            "accommodation_id": accommodation.id,
            "comment": textField.text!
        ]
        
        Alamofire.request("http://139.59.174.112/api/accommodation_comments.json", method: .post, parameters: parameters, encoding: JSONEncoding.default).response { [unowned self] response in
        
            
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accommodation.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        let comment = accommodation.comments[indexPath.row]
        
        cell.textLabel?.text = comment.comment
        
        return cell
    }
    
    @IBAction func dismissCurrentVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

