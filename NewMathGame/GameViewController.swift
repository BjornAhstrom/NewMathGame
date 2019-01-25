//
//  GameViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-23.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var name: String?
    var operand: String = ""
    var correctAnswer: Double = 0.0
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var increaseScore: Int = 0
    var timer = Timer()
    var seconds: Int = 10
    
    var addition: Bool = false
    var subtraction: Bool = false
    var multiplication: Bool = false
    var division: Bool = false
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var increaseScoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var showNumbersAndOperandLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        runTimer()
        resetRandomNumbersInNumbersAndOperandLabel()
    }
    
    func resetRandomNumbersInNumbersAndOperandLabel() {
        if addition == true {
            operand = "+"
        }
        else if subtraction == true {
            operand = "-"
        }
        else if multiplication == true {
            operand = "*"
        }
        else if division == true {
            operand = "/"
        }
        increaseScoreLabel.text! = "\(NSLocalizedString("points", comment: "")) \(increaseScore)"
        
        firstNumber = randomNumber()
        secondNumber = randomNumber()
        
        nameLabel.text! = name!
        showNumbersAndOperandLabel.text! = "\(firstNumber)  \(operand)  \(secondNumber)"
        
    }
    
    @IBAction func numberButtons(_ sender: UIButton) {
        answerLabel.text = answerLabel.text! + String(sender.tag)
    }
    
    @IBAction func eraseAndCommaButtons(_ sender: UIButton) {
        if sender.tag == 10 {
            answerLabel.text = ""
        }
        else if sender.tag == 11 {
            answerLabel.text = answerLabel.text! + "."
        }
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        mathematicalCalculations()
        if answerLabel.text == answerLabel.text {
            answerLabel.text = ""
        }
        resetRandomNumbersInNumbersAndOperandLabel()
    }
    
    func mathematicalCalculations() {
        let choosOperand = operand
        let answer = Double(answerLabel.text!)
        
        switch choosOperand {
        case "+":
            correctAnswer = Double(firstNumber + secondNumber)
            
            if correctAnswer == answer {
                increaseScore += 1
                print("Rätt")
            } else {
                print("Fel")
                showPopupWithWrongAnswer()
            }
            break
        case "-":
            if firstNumber < secondNumber {
                resetRandomNumbersInNumbersAndOperandLabel()
            } else {
                correctAnswer = Double(firstNumber - secondNumber)
                if correctAnswer == answer {
                    increaseScore += 1
                    print("Rätt")
                } else {
                    print("Fel")
                    showPopupWithWrongAnswer()
                }
            }
            break
        case "*":
            correctAnswer = Double(firstNumber * secondNumber)
            if correctAnswer == answer {
                increaseScore += 1
                print("Rätt")
            } else {
                print("Fel")
                showPopupWithWrongAnswer()
            }
            break
        case "/":
            correctAnswer = Double(firstNumber / secondNumber)
            if correctAnswer == answer {
                increaseScore += 1
                print("Rätt")
            } else {
                print("Fel")
                showPopupWithWrongAnswer()
            }
            break
        default:
            break
        }
    }
    
    func randomNumber() -> Int {
        let randomNumber = Int.random(in: 0 ... 10)
        return randomNumber
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(GameViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            //Send alert to indicate "time's up!"
            showPopupForFinalScore()
        } else {
            seconds -= 1
            timerLabel.text! = "\(NSLocalizedString("seconds", comment: "")) \(seconds)"
        }
    }
    
    func showPopupWithWrongAnswer() {
        
        let popup = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpId") as! PopupWithWrongAnswerViewController
        self.addChild(popup)
        popup.view.frame = self.view.frame
        self.view.addSubview(popup.view)
        popup.didMove(toParent: self)
        
        if popup.answerLabel.text == popup.answerLabel.text {
            popup.answerLabel.text = "\(NSLocalizedString("answer_is", comment: "")) \(correctAnswer)"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            popup.view.removeFromSuperview()
        }
    }
    
    func showPopupForFinalScore() {
        let popupFinalScore = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "finalScoreId") as! PopupFinalScoreViewController
        self.addChild(popupFinalScore)
        popupFinalScore.view.frame = self.view.frame
        self.view.addSubview(popupFinalScore.view)
        popupFinalScore.didMove(toParent: self)
        
        if popupFinalScore.nameLabel.text == popupFinalScore.nameLabel.text {
            popupFinalScore.nameLabel.text = nameLabel.text
        }
        
        if popupFinalScore.scoreLabel.text == popupFinalScore.scoreLabel.text {
            popupFinalScore.scoreLabel.text = "\(increaseScore) \(NSLocalizedString("points", comment: ""))"
        }
    }
    
}

