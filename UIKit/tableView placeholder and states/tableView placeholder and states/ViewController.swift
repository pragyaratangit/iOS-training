//
//  ViewController.swift
//  tableView placeholder and states
//
//  Created by Pragyaratan on 23/02/24.
//

import UIKit
import HGPlaceholders


class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate{
    

    
    private var tableView = TableView()
    var data = [1,2,3,5,6,7,8,]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        tableView.backgroundColor = .red
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(data[indexPath.row])
        return cell
    }
    
    

}

