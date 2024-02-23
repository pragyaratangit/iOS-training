//
//  MyTableViewController.swift
//  table and navigation
//
//  Created by Pragyaratan on 23/02/24.
//

import UIKit

class MyTableViewController: UITableViewController {

    
    var model: [(String, (() -> Void))] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // registering prototype cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // creat a cell
//        let cell = UITableViewCell()
        
        
        // dequeue a registered cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row].0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        model[indexPath.row].1()
    }

}
