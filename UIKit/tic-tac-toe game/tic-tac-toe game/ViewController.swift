//
//  ViewController.swift
//  tic-tac-toe game
//
//  Created by Pragyaratan on 01/03/24.
//

import UIKit

class ViewController: UIViewController {

    
    enum TurnCase {
        case Cross
        case Naught
    }
    
    let Cross = "X"
    let Naught = "O"
    
    var currentTurn = TurnCase.Cross
    var firstTurn = TurnCase.Cross
    
    @IBOutlet weak var currentTurnLabel: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var board: [UIButton] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
        currentTurnLabel.text = Cross
        resetBoard()
        // Do any additional setup after loading the view.
    }

    
    func checkForBoardFull() -> Bool {
        for button in board {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    

    func resetBoard() {
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
    }

    
    @IBAction func buttonTap(_ sender: UIButton){
        
        
        if sender.title(for: .normal) == nil {

            if currentTurn == .Cross {
                sender.setTitle(Cross, for: .normal)
                
                currentTurn = .Naught
                currentTurnLabel.text = Naught
              
            }
            else if currentTurn == .Naught {
                sender.setTitle(Naught, for: .normal)
                currentTurn = .Cross
                currentTurnLabel.text = Cross
                
                
            }
            sender.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
            sender.isEnabled = false
        }
        if checkForVictory() {
            let alertController = UIAlertController(title: "Game Over", message: "Winner" , preferredStyle: .actionSheet)
            
            
            let alert = UIAlertAction(title: "Reset", style: .default, handler:  { _ in
                self.resetBoard()
            })
            
            
            alertController.addAction(alert)
            self.present(alertController, animated:  true)
        }
        
        if checkForBoardFull() {
            let alertController = UIAlertController(title: "Game Over", message: "Want to continue", preferredStyle: .actionSheet)
            
            
            let alert = UIAlertAction(title: "Reset", style: .default, handler:  { _ in
                self.resetBoard()
            })
            
            
            alertController.addAction(alert)
            self.present(alertController, animated:  true)
        }
        
       
    }
    
    func checkCurrentType(_ s: String, _ btn: UIButton) -> Bool{
        return btn.title(for: .normal) == s
    }
    
    func checkForVictory() -> Bool {
        
        if currentTurn == .Cross {
            if checkCurrentType(Naught, a1) && checkCurrentType(Naught, a2) && checkCurrentType(Naught, a3) {
                return true
            }
            if checkCurrentType(Naught, b1) && checkCurrentType(Naught, b2) && checkCurrentType(Naught, b3) {
                return true
            }
            if checkCurrentType(Naught, c1) && checkCurrentType(Naught, c2) && checkCurrentType(Naught, c3) {
                return true
            }
            
            if checkCurrentType(Naught, a1) && checkCurrentType(Naught, b1) && checkCurrentType(Naught, c1) {
                return true
            }
            if checkCurrentType(Naught, a2) && checkCurrentType(Naught, b2) && checkCurrentType(Naught, c2) {
                return true
            }
            if checkCurrentType(Naught, a3) && checkCurrentType(Naught, b3) && checkCurrentType(Naught, c3) {
                return true
            }
            
            if checkCurrentType(Naught, a1) && checkCurrentType(Naught, b2) && checkCurrentType(Naught, c3) {
                return true
            }
            if checkCurrentType(Naught, a3) && checkCurrentType(Naught, b2) && checkCurrentType(Naught, c1) {
                return true
            }
            
        }
        else if currentTurn == .Naught {
            if checkCurrentType(Cross, a1) && checkCurrentType(Cross, a2) && checkCurrentType(Cross, a3) {
                return true
            }
            if checkCurrentType(Cross, b1) && checkCurrentType(Cross, b2) && checkCurrentType(Cross, b3) {
                return true
            }
            if checkCurrentType(Cross, c1) && checkCurrentType(Cross, c2) && checkCurrentType(Cross, c3) {
                return true
            }
            
            if checkCurrentType(Cross, a1) && checkCurrentType(Cross, b1) && checkCurrentType(Cross, c1) {
                return true
            }
            if checkCurrentType(Cross, a2) && checkCurrentType(Cross, b2) && checkCurrentType(Cross, c2) {
                return true
            }
            if checkCurrentType(Cross, a3) && checkCurrentType(Cross, b3) && checkCurrentType(Cross, c3) {
                return true
            }
            
            if checkCurrentType(Cross, a1) && checkCurrentType(Cross, b2) && checkCurrentType(Cross, c3) {
                return true
            }
            if checkCurrentType(Cross, a3) && checkCurrentType(Cross, b2) && checkCurrentType(Cross, c1) {
                return true
            }
        }
        
        
        return false
        
        
    }
    
    
}

