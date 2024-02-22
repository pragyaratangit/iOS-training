//
//  ViewController.swift
//  search in table
//
//  Created by Pragyaratan on 22/02/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var filtered = false
    var data = ["abc", "jes", "gdc", "hgaef", "jdsg","qoeo","woua","sdk"]
    var filteredData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty {
            print("backspace")
            var str = textField.text!
            print(str.removeLast())
            print("str \(str)")
            print(string)
            setFilterdata(str)
        }
        else if let text = textField.text {
            print("newchar")
            setFilterdata(text+string)
        }
        
        return true
    }
    
    func setFilterdata(_ query: String){
        
        filteredData.removeAll()
        
        print(query)
        if query.count == 0 {
            print("nodwhc")
            filteredData = []
            tableView.reloadData()
            return
        }
        for string in data {
            if string.lowercased().starts(with: query.lowercased()) {
                filteredData.append(string)
            }
        }
        filteredData.sort()
        tableView.reloadData()
        filtered = true
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty {
            return filteredData.count
        }
        return data.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if !filteredData.isEmpty {
            cell.textLabel?.text = filteredData[indexPath.row]
        }
        else {
            cell.textLabel?.text = data[indexPath.row]
        }
       
        return cell
    }
}

