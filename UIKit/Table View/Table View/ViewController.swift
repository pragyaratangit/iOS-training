//
//  ViewController.swift
//  Table View
//
//  Created by Pragyaratan on 22/02/24.
//

import UIKit

class ViewController: UIViewController {

    var names: [String] = ["Pragyaratan", "Ankita", "Sonali", "Ganesh", "Manmohan"]
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
//        
//        tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        tableView.register(DemoTableViewCell.nib(), forCellReuseIdentifier: DemoTableViewCell.identifier)
        
        tableView.register(FieldTableViewCell.nib(), forCellReuseIdentifier: FieldTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("table cell")
    }
    
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row > 5 {
            let cellWithField = tableView.dequeueReusableCell(withIdentifier: FieldTableViewCell.identifier, for: indexPath) as! FieldTableViewCell
            
//            cellWithField.myInputField
            return cellWithField
        }
        
        
        
        if indexPath.row > 2 {
            let cellWithImage = tableView.dequeueReusableCell(withIdentifier: DemoTableViewCell.identifier, for: indexPath) as! DemoTableViewCell
            
            cellWithImage.setImageLabel(with: "Gear", image: "gear")
            
            return cellWithImage
        }
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Hello world"
        let mySwitch = UISwitch()
        cell.accessoryView = mySwitch
        
        mySwitch.isOn = true
        mySwitch.addTarget(self, action: #selector(didSwitchChange), for: .valueChanged)
//        cell.myImage.backgroundColor = .red
//        cell.myLabel.text = names[indexPath.row]
        return cell
    }
    
    @objc func didSwitchChange(_ sender: UISwitch){
        if sender.isOn {
            print("swich is on")
        }
        else {
            print("switch is off")
        }
    }
}
