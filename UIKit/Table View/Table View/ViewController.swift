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
        
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("table cell")
    }
    
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath)  as! DemoTableViewCell
        
        
        cell.myImage.backgroundColor = .red
        cell.myLabel.text = names[indexPath.row]
        return cell
    }
}
