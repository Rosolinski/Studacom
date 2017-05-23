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

class CommentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var refreshAlert: UIAlertController?
    let cellReuseIdentifier = "cell"
    
    var comment: Comment!
    var comments = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Comments"
        self.hideKeyboardWhenTappedAround()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadComment()
    }
    
    func loadComment() {
        Alamofire.request("http://139.59.174.112/api/comments.json").response { [unowned self] response in
            
            guard let data = response.data else { return }
            
            let json = JSON(data: data)
            
            for commentData in json["data"].arrayValue {
                let comment = Comment(json: commentData)
                self.comments.append(comment)
            }
            
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        let comment = comments[indexPath.row]
        
        cell.textLabel?.text = comment.comment
        
        return cell
    }
    
    @IBAction func dismissCurrentVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

