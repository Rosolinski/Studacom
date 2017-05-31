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
    
    var refreshAlert: UIAlertController?
    let cellReuseIdentifier = "cell"
    
    var accommodation: Accommodation!
    
    var accommodations = [Accommodation]()
    var filteredData = [Accommodation]()
    
    var isSearching = false
    
    let distanceData = ["Distance from BU ↕ ", "0 – 3 miles", "3 – 6 miles", "Over 6 miles"]
    let priceData = ["Rent (pcm) ↕ ","£0 – 100", "£101 – 200", "£201 – 300", "£301 – 400", "£401 – 500", "£500 +"]
    let spaceData = ["Number of spaces ↕ ", "1", "2", "3", "4", "Over 4"]
    
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
        self.hideKeyboardWhenTappedAround()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "newPropertySegue" {
            let vc = segue.destination as! PropertyInfoViewController
            vc.accommodation = sender as! Accommodation
        }
    }

    //tables
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
            return isSearching ? filteredData.count : accommodations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        var accommodation: Accommodation!
        
        if isSearching {
            accommodation = filteredData[indexPath.row]
        } else {
            accommodation = accommodations[indexPath.row]
        }
        
        cell.textLabel?.text = accommodation.accommodation_type
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell number \(indexPath.row) tapped.")
        
        let accommodation = accommodations[indexPath.row]
        
        performSegue(withIdentifier: "newPropertySegue", sender: accommodation)
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            
            isSearching = false
            
            view.endEditing(true)
            
            
        } else {
            
            isSearching = true
            filteredData.removeAll()
            
            for accommodation in accommodations {
                if accommodation.accommodation_type.lowercased().range(of: searchBar.text!.lowercased()) != nil {
                    filteredData.append(accommodation)
                }
            }

            
        }
        
        tableView.reloadData()
    }
    
    @IBAction func dismissVCBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
