//
//  TrainOnMathViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-29.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class TrainOnMathViewController: ColorViewController {
    private var answer: Double = 0.0
    private var tempAnswer: Double = 0.0
    private var correctAnswer: Double = 0.0
    private var firstNumber: Int = 0
    private var secondNumber: Int = 0
    private var operand: String = ""
    
    public var numberFromSenderTag : Int = 0
    public var addition: Bool = false
    public var subtraction: Bool = false
    public var multiplication: Bool = false
    public var division: Bool = false
    
    @IBOutlet weak var numberAndOperandLabel: UILabel!
    @IBOutlet weak var equalLabel: UILabel!
    @IBOutlet weak var userInputLabel: UILabel!
    
    @IBOutlet weak var buttonZero: RoundButton!
    @IBOutlet weak var buttonOne: RoundButton!
    @IBOutlet weak var buttonTwo: RoundButton!
    @IBOutlet weak var buttonThree: RoundButton!
    @IBOutlet weak var buttonFour: RoundButton!
    @IBOutlet weak var buttonFive: RoundButton!
    @IBOutlet weak var buttonSix: RoundButton!
    @IBOutlet weak var buttonSeven: RoundButton!
    @IBOutlet weak var buttonEight: RoundButton!
    @IBOutlet weak var buttonNine: RoundButton!
    @IBOutlet weak var eraseButton: RoundButton!
    @IBOutlet weak var commaButton: RoundButton!
    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet weak var answerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontAndImagesButtons()
        resetRandomNumbersInNumbersAndOperandLabel()
    }
    
    func fontAndImagesButtons() {
        buttonZero.setBackgroundImage(Theme.current.imagesOnNumPadButtons, for: .normal)
        buttonZero.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonOne.setBackgroundImage(Theme.current.imagesOnNumPadButtons, for: .normal)
        buttonOne.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonTwo.setBackgroundImage(Theme.current.imagesOnNumPadButtons, for: .normal)
        buttonTwo.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonThree.setBackgroundImage(Theme.current.imagesOnNumPadButtons, for: .normal)
        buttonThree.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonFour.setBackgroundImage(Theme.current.imagesOnNumPadButtons, for: .normal)
        buttonFour.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonFive.setBackgroundImage(Theme.current.imagesOnNumPadButtons, for: .normal)
        buttonFive.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonSix.setBackgroundImage(Theme.current.imagesOnNumPadButtons, for: .normal)
        buttonSix.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonSeven.setBackgroundImage(Theme.current.imagesOnNumPadButtons, for: .normal)
        buttonSeven.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonEight.setBackgroundImage(Theme.current.imagesOnNumPadButtons, for: .normal)
        buttonEight.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonNine.setBackgroundImage(Theme.current.imagesOnNumPadButtons, for: .normal)
        buttonNine.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        eraseButton.setBackgroundImage(Theme.current.imagesOnNumPadButtons, for: .normal)
        eraseButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        commaButton.setBackgroundImage(Theme.current.imagesOnNumPadButtons, for: .normal)
        commaButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        quitButton.setBackgroundImage(Theme.current.imagesOnQuitButtons, for: .normal)
        quitButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        answerButton.setBackgroundImage(Theme.current.imagesOnStartPlayAndAnswerButtons, for: .normal)
        answerButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
    }
    
    func buttonEnable() {
        buttonZero.isEnabled = true
        buttonOne.isEnabled = true
        buttonTwo.isEnabled = true
        buttonThree.isEnabled = true
        buttonFour.isEnabled = true
        buttonFive.isEnabled = true
        buttonSix.isEnabled = true
        buttonSeven.isEnabled = true
        buttonEight.isEnabled = true
        buttonNine.isEnabled = true
        eraseButton.isEnabled = true
        commaButton.isEnabled = true
        quitButton.isEnabled = true
        answerButton.isEnabled = true
    }
    
    func buttonDisable() {
        buttonZero.isEnabled = false
        buttonOne.isEnabled = false
        buttonTwo.isEnabled = false
        buttonThree.isEnabled = false
        buttonFour.isEnabled = false
        buttonFive.isEnabled = false
        buttonSix.isEnabled = false
        buttonSeven.isEnabled = false
        buttonEight.isEnabled = false
        buttonNine.isEnabled = false
        eraseButton.isEnabled = false
        commaButton.isEnabled = false
        quitButton.isEnabled = false
        answerButton.isEnabled = false
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
        equalLabel.font = UIFont(name: Theme.current.fontForLabels, size: 60)
        userInputLabel.font = UIFont(name: Theme.current.fontForLabels, size: 40)
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
            print("\(numberFromSenderTag)")
            firstNumber = numberFromSenderTag
        }
        else if division == true {
            operand = "/"
            if firstNumber < secondNumber {
                let temp = firstNumber
                firstNumber = secondNumber
                secondNumber = temp
            }
        }
        numberAndOperandLabel.font = UIFont(name: Theme.current.fontForLabels, size: 40)
        numberAndOperandLabel.text! = "\(firstNumber)  \(operand)  \(secondNumber)"
    }
    
    func giveFirstAndSecondNumbersRandomNumbers() {
        firstNumber = randomNumbers()
        secondNumber = randomNumbers()
        
        if operand == "+" {
            while firstNumber == 0 || secondNumber == 0 {
                firstNumber = randomNumbers()
                secondNumber = randomNumbers()
            }
        }
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
        if let ans = Double(userInputLabel.text!) {
            answer = ans
        }
        
        tempAnswer = NewMathGame.mathematicalCalculations(firstNumber: Double(firstNumber), secondNumber: Double(secondNumber), operand: operand)
        correctAnswer = Double(round(100*tempAnswer)/100)
        
        if correctAnswer != answer {
            showPopupWithWrongAnswer()
        }
    }
    
    func randomNumbers() -> Int {
        let randomNumbers = Int.random(in: 0 ... 10)
        return randomNumbers
    }
    
    func showPopupWithWrongAnswer() {
        buttonDisable()
        let popup = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpId") as! PopupWithWrongAnswerViewController
        self.addChild(popup)
        popup.view.frame = self.view.frame
        self.view.addSubview(popup.view)
        popup.didMove(toParent: self)
        
        if operand == "/" {
            tempAnswer = Double(round(100*correctAnswer)/100)
            popup.answerLabel.text = "\(NSLocalizedString("answer_is", comment: "")) \(tempAnswer)"
        } else {
            popup.answerLabel.text = "\(NSLocalizedString("answer_is", comment: "")) \(String(format: "%.0f", correctAnswer))"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.buttonEnable()
            popup.view.removeFromSuperview()
        }
    }
}
