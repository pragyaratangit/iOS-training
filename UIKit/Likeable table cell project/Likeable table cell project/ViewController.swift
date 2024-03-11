//
//  ViewController.swift
//  Likeable table cell project
//
//  Created by Pragyaratan on 26/02/24.
//

import UIKit


class LikeableItem{
    var text: String
    var isLiked = false
    
    init(text: String) {
        self.text = text
    }
}


class DataClass {
    var items: [LikeableItem] = ["first","Second", "Third", "Fourth"].compactMap({LikeableItem(text: $0)})
    
    
    func getData() -> [LikeableItem] {
        return items
    }
    func getLikedData() -> [LikeableItem] {
        var arr = [LikeableItem]()
        
        for item in items {
            if item.isLiked {
                arr.append(item)
            }
        }
        return arr
    }
     func addData(text: String) {
        items.append(LikeableItem(text: text))
    }
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let items:[LikeableItem] = DataClass().getData()
   

    
    private let table: UITableView = {
        let table = UITableView()
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        table.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        table.deselectRow(at: indexPath, animated: true)
        item.isLiked = !item.isLiked
        
        table.reloadRows(at: [indexPath], with: .automatic)
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = items[indexPath.row]
        
        cell.textLabel?.text =  item.text
        
        cell.imageView?.image = item.isLiked ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        
        return cell
    }
    
    
}

