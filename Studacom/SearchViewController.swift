//
//  SearchViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 23/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class SearchViewController: UIViewController, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate, UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var distancePickerView: UIPickerView!
    @IBOutlet var pricePickerView: UIPickerView!
    @IBOutlet var spacePickerView: UIPickerView!
    
    var picker = UIPickerView()
    
    let distanceData = ["Distance from BU ↕ ", "0 – 5 miles", "6 – 10 miles", "Over 10 miles"]
    let priceData = ["Rent (pcm) ↕ ","£0 – 100", "£101 – 200", "£201 – 300", "£301 – 400", "£401 – 500", "£500 +"]
    let spaceData = ["Number of spaces ↕ ", "1", "2", "3", "4", "5", "6", "Over 6"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pricePickerView {
        return priceData.count
        } else if pickerView == spacePickerView{
        return spaceData.count
        } else if pickerView == distancePickerView{
            return distanceData.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pricePickerView {
            return priceData[row]
        } else if pickerView == spacePickerView{
            return spaceData[row]
        } else if pickerView == distancePickerView{
            return distanceData[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

    }
    
    var refreshAlert: UIAlertController?
    let cellReuseIdentifier = "cell"
    
    var accommodation: Accommodation!
    
    var accommodations = [Accommodation]()
    var filtered:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
        self.hideKeyboardWhenTappedAround()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self

        loadAccommodation()
        
    }
    
    func loadAccommodation() {
        Alamofire.request("http://139.59.174.112/api/accommodations.json").response { [unowned self] response in
            
            guard let data = response.data else { return }
            
            let json = JSON(data: data)
            
            for accommodationData in json["data"].arrayValue {
                let accommodation = Accommodation(json: accommodationData)
                self.accommodations.append(accommodation)
            }
            
            self.tableView.reloadData()
        }
    }

    //tables
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accommodations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        let accommodation = accommodations[indexPath.row]
        
        cell.textLabel?.text = accommodation.accommodation_type
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell number \(indexPath.row) tapped.")
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        //textField code
        
        textField.resignFirstResponder()  //if desired
        performAction()
        return true
        
    }
    
    func performAction() {
        
        //action events
    }

}
