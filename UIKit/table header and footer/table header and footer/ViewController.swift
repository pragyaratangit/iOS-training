//
//  ViewController.swift
//  table header and footer
//
//  Created by Pragyaratan on 23/02/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    
    var data = [
    ["one", "two", "three"],
    ["a", "b", "c", "d"],
    ["only one"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .black
        let headerView = UIView(frame: CGRect(x:0, y:0, width: view.frame.size.width, height: 100))
        headerView.backgroundColor = .blue
        let headerLabel = UILabel()
        headerLabel.text = "Header for Table"
        headerLabel.frame = headerView.bounds
        headerView.addSubview(headerLabel)
        headerLabel.textAlignment = .center
        let footerView = UIView(frame: CGRect(x:0, y:0, width: view.frame.size.width, height: 100))
        footerView.backgroundColor = .purple
        let footerLabel = UILabel()
        footerLabel.text = "Footer for Tabel"
        footerView.addSubview(footerLabel)
        footerLabel.frame = footerView.bounds
        footerLabel.textAlignment = .center
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = footerView
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    // header and footer for each section
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView(frame: CGRect(x:0, y:0, width: view.frame.size.width, height: 100))
            headerView.backgroundColor = .red
         let headerLabel = UILabel()
         headerLabel.text = "Header for section " + "\(section)"
         headerLabel.frame = headerView.bounds
         headerView.addSubview(headerLabel)
         headerLabel.textAlignment = .center
            return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x:0, y:0, width: view.frame.size.width, height: 100))
        footerView.backgroundColor = .orange
        let footerLabel = UILabel()
        footerLabel.text = "Footer for section " + "\(section)"
        footerView.addSubview(footerLabel)
        footerLabel.frame = footerView.bounds
        footerLabel.textAlignment = .center
        return footerView
    }
   
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        cell.backgroundColor = .green
        return cell
    }
    
    
}

