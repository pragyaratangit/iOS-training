//
//  ViewController.swift
//  concurrency and Parallelism
//
//  Created by Pragyaratan on 06/03/24.
//

import UIKit

class CustomeThread {
    var thread: Thread?
    func createThread() {
        thread = Thread(target: self, selector: #selector(threadSelector), object: nil)
    }
    
    @objc func threadSelector(_ sender: Any){
        print("Thread start working")
    }
    func startThread() {
        thread?.start()
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        executeThread()
    }
    
    func executeThread() {
        let customeThread = CustomeThread()
        customeThread.createThread()
        customeThread.startThread()
    }
    
    

}

