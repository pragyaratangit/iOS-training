//
//  ViewController.swift
//  table programatically
//
//  Created by Pragyaratan on 23/02/24.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    // create a table
    
    private let myTableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self
                         , forCellReuseIdentifier: "cell")
        table.register(CodedTableViewCell.self, forCellReuseIdentifier: CodedTableViewCell.indetifier)
        return table
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // for adding a view into already existing view
        view.addSubview(myTableView)
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    // setting frame and layout constraints
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTableView.frame = view.bounds
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row > 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CodedTableViewCell.indetifier, for: indexPath) as! CodedTableViewCell
            
            cell.configure(with: "Gear", imageName: "myImage")
            
            
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "test"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row > 2{
            return 100
        }
       
            
        return 50
    }
}

