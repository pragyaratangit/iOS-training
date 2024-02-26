//
//  ViewController.swift
//  Likeable table cell project
//
//  Created by Pragyaratan on 26/02/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data = ["first", "second", "third", "fouth", "fifth"]
//    var favData:[String] = []
   
//    var refToFavClass: FavouriteTab?
    @IBOutlet weak var table: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        view.addSubview(table)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        table.dataSource = self
        table.delegate = self
//        refToFavClass = FavouriteTab()
        
    }

//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        table.frame = view.bounds
//        favTable.frame = v
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.imageView?.image = UIImage(systemName: "heart")
        
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.imageView?.image == UIImage(systemName: "heart.fill"){
            cell?.imageView?.image = UIImage(systemName: "heart")
//            refToFavClass?.favData.removeAll(where: {
//                text in
//                text == cell?.textLabel?.text
//            })
        }
        else{
            cell?.imageView?.image = UIImage(systemName: "heart.fill")
//            refToFavClass?.favData.append(data[indexPath.row])
        }
        
        
    }
    
}



class FavouriteTab: UIViewController ,UITableViewDelegate, UITableViewDataSource  {
   
    public var favData: [String] = ["abc", "bcd", "def"]
    
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        table.dataSource = self
        table.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = favData[indexPath.row]
        
        return cell
    }
}
