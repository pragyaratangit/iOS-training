//
//  ViewController.swift
//  collection view in table cell
//
//  Created by Pragyaratan on 29/02/24.
//

import UIKit


struct Model {
    var description: String
    var imageName: String
    
    init(description: String, imageName: String) {
        self.description = description
        self.imageName = imageName
    }
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    var models: [Model] = [ ]
    
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        models.append(Model(description: "Dog", imageName: "animal"))
        models.append(Model(description: "Parrot", imageName:"bird"))
        models.append(Model(description: "Dog", imageName: "animal"))
        models.append(Model(description: "Parrot", imageName:"bird"))
        models.append(Model(description: "Dog", imageName: "animal"))
        models.append(Model(description: "Parrot", imageName:"bird"))
        
        
        
        table.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        
        table.delegate = self
        
        table.dataSource = self
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        cell.configure(with: models)
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
        
    }
}



