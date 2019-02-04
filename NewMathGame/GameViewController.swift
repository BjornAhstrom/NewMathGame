//
//  GameViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-23.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

extension Array {
    func randomItem() -> String? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index] as? String
    }
}

class GameViewController: UIViewController {
    private let mathCalaculations = MathematicalCalculations()
    private var correctAnswer: Double = 0.0
    private var firstNumber: Int = 0
    private var secondNumber: Int = 0
    private var increaseScore: Int = 0
    private var timer = Timer()
    private var seconds: Int = 31
    private var arrayOfOperands = [String]()
    
    var valueFromPickerView: Int = 0
    var name: String?
    var operand: String = ""
    
    var addition: Bool = false
    var subtraction: Bool = false
    var multiplication: Bool = false
    var division: Bool = false
    var stopTimer: Bool = false
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var increaseScoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var showNumbersAndOperandLabel: UILabel!
    @IBOutlet weak var equalLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        
        runTimer()
        resetRandomNumbersInNumbersAndOperandLabel()
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
    
    @IBAction func quitButton(_ sender: UIButton) {
        showPopupForFinalScore()
        stopingTimer()
        print("Timer Stopped with button press")
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        mathematicalCalculations()
        answerLabel.text! = ""
        resetRandomNumbersInNumbersAndOperandLabel()
    }
    
    func userSelectedDifficultyLevelInPickerView() {
        switch valueFromPickerView {
        case 0:
            firstNumber = easyRandomNumber()
            secondNumber = easyRandomNumber()
            
            if operand == "+" || operand == "-" || operand == "/"   {
                while firstNumber == 0 || secondNumber == 0 {
                    firstNumber = easyRandomNumber()
                    secondNumber = easyRandomNumber()
                }
            }
            break
        case 1:
            firstNumber = mediumRandomNumber()
            secondNumber = mediumRandomNumber()
            
            if operand == "+" || operand == "-" || operand == "/" {
                while firstNumber == 0 || secondNumber == 0 {
                    firstNumber = mediumRandomNumber()
                    secondNumber = mediumRandomNumber()
                }
            }
            break
        case 2:
            firstNumber = difficultRandomNumber()
            secondNumber = difficultRandomNumber()
            
            if operand == "+" || operand == "-" || operand == "/" {
                while firstNumber == 0 || secondNumber == 0 {
                    firstNumber = difficultRandomNumber()
                    secondNumber = difficultRandomNumber()
                }
            }
            break
        default:
            print("Error")
        }
    }
    
    func resetRandomNumbersInNumbersAndOperandLabel() {
        userSelectedDifficultyLevelInPickerView()
        
        answerLabel.font = UIFont(name: "Marker Felt", size: 30)
        equalLabel.font = UIFont(name: "Marker Felt", size: 35)
        
        if let names = name {
            nameLabel.font = UIFont(name: "Marker Felt", size: 25)
            nameLabel.text! = names
        }
        
        if addition == true {
            arrayOfOperands.append("+")
        }
        if subtraction == true {
            arrayOfOperands.append("-")
            if firstNumber < secondNumber {
                let temp = firstNumber
                firstNumber = secondNumber
                secondNumber = temp
            }
        }
        if multiplication == true {
            arrayOfOperands.append("*")
        }
        if division == true {
            arrayOfOperands.append("/")
            if firstNumber < secondNumber {
                let temp = firstNumber
                firstNumber = secondNumber
                secondNumber = temp
            }
        }
        
        if let test = arrayOfOperands.randomItem() {
            operand = test
        }
        
        increaseScoreLabel.font = UIFont(name: "Marker Felt", size: 25)
        increaseScoreLabel.text! = "\(NSLocalizedString("points", comment: "")) \(increaseScore)"
        showNumbersAndOperandLabel.font = UIFont(name: "Marker Felt", size: 35)
        showNumbersAndOperandLabel.text! = "\(firstNumber)  \(operand)  \(secondNumber)"
    }
    
    func mathematicalCalculations() {
        let answer = Double(answerLabel.text!)
        
        correctAnswer = mathCalaculations.mathematicalCalculations(firstNumber: Double(firstNumber), secondNumber: Double(secondNumber), operand: operand)
        
        if correctAnswer == answer {
            increaseScore += 1
        } else {
            showPopupWithWrongAnswer()
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
        let saveNameAndScore = highScore()
        
        let popupFinalScore = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "finalScoreId") as! PopupFinalScoreViewController
        self.addChild(popupFinalScore)
        popupFinalScore.view.frame = self.view.frame
        self.view.addSubview(popupFinalScore.view)
        popupFinalScore.didMove(toParent: self)
        
        saveNameAndScore.saveNameAndScore(name: name!, score: increaseScore)
        saveNameAndScore.saveUserData()
        
        if popupFinalScore.nameLabel.text == popupFinalScore.nameLabel.text {
            popupFinalScore.nameLabel.text = nameLabel.text
        }
        
        if popupFinalScore.scoreLabel.text == popupFinalScore.scoreLabel.text {
            popupFinalScore.scoreLabel.text = "\(increaseScore) \(NSLocalizedString("points", comment: ""))"
        }
    }
    
    func easyRandomNumber() -> Int {
        let easyRandomNumber = Int.random(in: 0 ... 10)
        return easyRandomNumber
    }
    func mediumRandomNumber() -> Int {
        let mediumRandomNumber = Int.random(in: 0 ... 100)
        return mediumRandomNumber
    }
    
    func difficultRandomNumber() -> Int {
        let difficultRandomNumber = Int.random(in: 0 ... 1000)
        return difficultRandomNumber
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(GameViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            //Send alert to indicate "time's up!"
            print("timer stopped when times ran out")
            showPopupForFinalScore()
        } else {
            seconds -= 1
            timerLabel.font = UIFont(name: "Marker Felt", size: 25)
            timerLabel.text! = "\(NSLocalizedString("seconds", comment: "")) \(seconds)"
        }
    }
    
    func stopingTimer() {
        if self.stopTimer == false {
            timer.invalidate()
            self.stopTimer = true
        }
    }
    
    func setGradientBackground() {
        let colorTop =    UIColor(red: 0.0/255.0, green: 191.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorMiddle = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 65.0/255.0, green: 105.0/255.0, blue: 225.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorMiddle, colorBottom]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
