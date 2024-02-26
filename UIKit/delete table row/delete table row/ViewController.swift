//
//  ViewController.swift
//  delete table row
//
//  Created by Pragyaratan on 26/02/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate , UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var table: UITableView!
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    
    
    var data = ["1","2","3","4","5","6","7","8","9","10"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self
        textField.delegate = self
    }

    
    
    @IBAction func addBtnTap(_ sender: Any) {
        guard let text = textField.text else {
            return
        }
        
        data.append(text)
        
        let indexPath = IndexPath(row: data.count - 1, section: 0)
        
        
        
        table.beginUpdates()
        table.insertRows(at: [indexPath], with: .fade)
        
        table.endUpdates()
        
        textField.text = nil
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
       return  .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            table.beginUpdates()
            data.remove(at: indexPath.row)
            table.deleteRows(at: [indexPath], with: .bottom)
            
            table.endUpdates()
        }
        
        
    }
}

