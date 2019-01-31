//
//  TrainOnMathViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-29.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class TrainOnMathViewController: UIViewController {
    @IBOutlet weak var numberAndOperandLabel: UILabel!
    @IBOutlet weak var userInputLabel: UILabel!
    @IBOutlet weak var buttons: UIButton!
    
    private var mathCalc = MathematicalCalculations()
    var addition: Bool = false
    var subtraction: Bool = false
    var multiplication: Bool = false
    var division: Bool = false
    var correctAnswer: Double = 0
    
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var operand: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetRandomNumbersInNumbersAndOperandLabel()
    }
    
    @IBAction func numberButtons(_ sender: UIButton) {
        userInputLabel.text = userInputLabel.text! + String(sender.tag)
    }
    
    @IBAction func eraseAndCommaButtons(_ sender: UIButton) {
        if sender.tag == 10 {
            userInputLabel.text! = ""
        }
        else if sender.tag == 11 {
            userInputLabel.text = userInputLabel.text! + "."
        }
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        mathematicalCalculations()
        userInputLabel.text = ""
        resetRandomNumbersInNumbersAndOperandLabel()
    }
    
    func resetRandomNumbersInNumbersAndOperandLabel() {
        giveFirstAndSecondNumbersRandomNumbers()
        
        if addition == true {
            operand = "+"
        }
        else if subtraction == true {
            operand = "-"
            if firstNumber < secondNumber {
                let temp = firstNumber
                firstNumber = secondNumber
                secondNumber = temp
            }
        }
        else if multiplication == true {
            operand = "*"
        }
        else if division == true {
            operand = "/"
            if firstNumber < secondNumber {
                let temp = firstNumber
                firstNumber = secondNumber
                secondNumber = temp
            }
        }
        numberAndOperandLabel.text! = "\(firstNumber)  \(operand)  \(secondNumber)"
    }
    
    func giveFirstAndSecondNumbersRandomNumbers() {
        firstNumber = randomNumbers()
        secondNumber = randomNumbers()
        
        if operand == "-" {
            while firstNumber == 0 || secondNumber == 0  {
                firstNumber = randomNumbers()
                secondNumber = randomNumbers()
            }
        }
        else if operand == "/" {
            while firstNumber == 0 || secondNumber == 0 || firstNumber % 2 != 0 || secondNumber % 2 != 0 {
                firstNumber = randomNumbers()
                secondNumber = randomNumbers()
            }
        }
    }
    
    func mathematicalCalculations() {
        let answer = Double(userInputLabel.text!)
        switch operand {
        case "+":
            correctAnswer = Double(firstNumber + secondNumber)
            
            if correctAnswer != answer {
                showPopupWithWrongAnswer()
            }
            break
        case "-":
            correctAnswer = Double(firstNumber - secondNumber)
            if correctAnswer != answer {
                showPopupWithWrongAnswer()
            }
            break
        case "*":
            correctAnswer = Double(firstNumber * secondNumber)
            if correctAnswer != answer {
                showPopupWithWrongAnswer()
            }
            break
        case "/":
            correctAnswer = Double(firstNumber / secondNumber)     //Kraschar när det blir noll
            if correctAnswer != answer {
                showPopupWithWrongAnswer()
            }
            break
        default:
            break
        }
    }
    
    func randomNumbers() -> Int {
        let randomNumbers = Int.random(in: 0 ... 10)
        return randomNumbers
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
}
