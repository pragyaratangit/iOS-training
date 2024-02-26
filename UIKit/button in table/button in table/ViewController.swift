//
//  ViewController.swift
//  button in table
//
//  Created by Pragyaratan on 26/02/24.
//




import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var data = ["first", "second", "third", "forth", "fifth"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        cell.configure(with: data[indexPath.row])
        cell.delegate = self
        return cell
    }
    

}


extension ViewController: MyTableViewCellDelegate {
    func didTap(with title: String) {
        let alert = UIAlertController(title: "tap", message: "button \(title) tapped sucessfully", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "close", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
