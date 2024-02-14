//
//  ViewController.swift
//  other inputs
//
//  Created by Pragyaratan on 14/02/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var textOutput: UILabel!
    
    @IBOutlet weak var dateOutput: UILabel!
    @IBOutlet weak var dateInput: UIDatePicker!
    
    @IBOutlet weak var sliderOutput: UILabel!
    @IBOutlet weak var sliderInput: UISlider!
    
    @IBOutlet weak var stepperOutput: UILabel!
    @IBOutlet weak var stepperInput: UIStepper!
    
    @IBOutlet weak var switchOutput: UILabel!
    @IBOutlet weak var switchInput: UISwitch!
    
    
    
    let dateFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initialSetup()
    }

    func initialSetup() {
        
        // textField setup
        textInput.delegate = self
        textInput.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textOutput.text = textInput.text!
        
        // date setup
        dateInput.datePickerMode = .dateAndTime
        dateInput.preferredDatePickerStyle = .compact
        dateInput.date = Date()
        dateInput.locale = .current
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateOutput.text = dateFormatter.string(from: dateInput.date)
        
        
        // slider setup
        sliderInput.minimumValue = 0
        sliderInput.maximumValue = 100
        sliderInput.value = 20
        sliderOutput.text = String(Int(sliderInput.value))
        
        
        // stepper
        stepperInput.minimumValue = -100
        stepperInput.maximumValue = 100
        stepperInput.value = 0
        stepperInput.stepValue = 10
        stepperOutput.text = String(stepperInput.value)
        // if true then change will reflect continuosly but if false then change will reflect after releasing it
        stepperInput.isContinuous = true
        
        // will send a single value after releasing the button if set to false
        stepperInput.autorepeat = true
        
        
        // switch setup
        switchInput.isOn = true
        switchOutput.text = "on"
    }

    @objc func textFieldDidChange(_ textField: UITextField){
        textOutput.text = textInput.text ?? ""
    }
    
//    @IBAction func textInputChange(_ sender: Any) {
//        
//        textOutput.text = textInput.text
//    }
    
    @IBAction func dateChange(_ sender: Any) {
        dateOutput.text = dateFormatter.string(from: dateInput.date)
    }
    
    @IBAction func stepperAction(_ sender: Any) {
        stepperOutput.text = String(stepperInput.value)
    }
    
    @IBAction func switchAction(_ sender: Any) {
        if switchInput.isOn {
            switchOutput.text = "on"
        }
        else{
            switchOutput.text = "off"
        }
    }
    
    @IBAction func sliderAction(_ sender: Any) {
        sliderOutput.text = String(Int(sliderInput.value))
    }
    
}

