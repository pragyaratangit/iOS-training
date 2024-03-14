//
//  CustomView.swift
//  custom view component
//
//  Created by Pragyaratan on 13/03/24.
//

import UIKit

class CustomView: UIView {

    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    var count = 0
    
    var timer: Timer? = nil
    
//    lazy var increaseTimer = DispatchWorkItem(){
//        self.timer += 1
//    }
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        configView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configView()
    }
    
    
    private func configView() {
        guard let view = self.loadViewFromNIb(nibName: "CustomView") else {return}
        view.frame = self.bounds
        self.addSubview(view)
        counterLabel.text = "0"
        resetButton.layer.cornerRadius = 10
        startButton.layer.cornerRadius = 10
        stopButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func resetTimer(_ sender: Any) {
//        timer = 0
        count = 0
        counterLabel.text = "0"
        timer?.invalidate()
        timer = nil
    }
    
    
    @IBAction func startTimer(_ sender: Any) {
        incrementTimer()
    }
    
    private func incrementTimer() {
        print("func called")
   
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                print("Timer fired!")
                self.count += 1
                self.counterLabel.text = String(self.count)
            }
        }
        
        
    }
    
    
    @IBAction func stopTimer(_ sender: Any) {
        timer?.invalidate()
        timer = nil
    }
    
}



