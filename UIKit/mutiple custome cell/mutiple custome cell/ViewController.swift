//
//  ViewController.swift
//  mutiple custome cell
//
//  Created by Pragyaratan on 26/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var navBarButton: UIBarButtonItem!
    
    var data = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        table.delegate = self
        
        table.register(FirstTableViewCell.nib(), forCellReuseIdentifier: FirstTableViewCell.identifier)
        
        table.register(SecondTableViewCell.nib(), forCellReuseIdentifier: SecondTableViewCell.identifier)
    }
    
    
    

    @IBAction func navBarButtonTap(_ sender: UIBarItem) {
        
        if table.isEditing {
            navBarButton.title = "Edit"
            table.isEditing = false
        }
        else {
            navBarButton.title = "Fix"
            table.isEditing = true
        }
        
    }
    
}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        vc.lbl = data[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        if indexPath.row % 2 == 0 {
            cell = table.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath)
            cell?.accessoryType = .detailDisclosureButton
        }
        else{
            cell = table.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifier, for: indexPath)
            let _switch = UISwitch()
            _switch.isOn = true
            cell?.accessoryView = _switch
        }
        
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    
}
