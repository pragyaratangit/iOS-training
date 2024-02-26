//
//  ViewController.swift
//  Move cell of table
//
//  Created by Pragyaratan on 26/02/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    var data = ["First", "Second", "Third", "Fourth"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
    
    // allow the tablecell to move
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // swap the data
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        data.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    @IBAction func barButtonTap(_ sender: UIBarItem) {
        
        if tableView.isEditing {
            sender.title = "Edit"
            tableView.isEditing = false
        }
        else{
            sender.title = "Fix"
            tableView.isEditing = true
        }
    }
    
}

