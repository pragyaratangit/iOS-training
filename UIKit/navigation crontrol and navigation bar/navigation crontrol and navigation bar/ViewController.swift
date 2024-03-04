//
//  ViewController.swift
//  navigation crontrol and navigation bar
//
//  Created by Pragyaratan on 04/03/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        configureNavBar()
    }
    
    func configureNavBar() {
        self.navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                title: "Profile",
                style: .done,
                target: self,
                action: nil
            ),
            UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: nil)
            
        ]
        
        
        // custom view as barItem
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 40))
        
        label.text = "CUSTOM"
        label.backgroundColor = .green
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(
//            image: UIImage(systemName: "car"),
//            style: .done,
//            target: self,
//            action: nil
//        )
        
        
    }

    @IBAction func buttonTap(_ sender: UIButton){
        
        
        // there is difference between present and push
        
        // by push new VC will appear from right and cover whole area with titleBar at the top
        
        // but by present new VC will slide from bottom and leave some space at the top
        
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
        
       
//        self.navigationController?.present(SecondViewController(), animated: true)
    }

}

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        view.backgroundColor = .red
        self.navigationItem.largeTitleDisplayMode = .never
        self.title = "Second"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "log out", image: UIImage(systemName: "escape"), target: self, action: nil)
    }


}
