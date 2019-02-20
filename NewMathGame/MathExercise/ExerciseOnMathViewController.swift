//
//  TrainOnMathViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-29.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class ExerciseOnMathViewController: ColorViewController {
    private var answer: Double = 0.0
    private var tempAnswer: Double = 0.0
    private var correctAnswer: Double = 0.0
    private var firstNumber: Int = 0
    private var secondNumber: Int = 0
    private var operand: String = ""
    
    public var ValueFromPickerView: Int = 0
    public var numberFromSenderTag : Int = 0
    public var addition: Bool = false
    public var subtraction: Bool = false
    public var multiplication: Bool = false
    public var division: Bool = false
    
    @IBOutlet weak var numberAndOperandLabel: UILabel!
    @IBOutlet weak var equalLabel: UILabel!
    @IBOutlet weak var userInputLabel: UILabel!

    @IBOutlet var numPadButtons: [UIButton]!
    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet var quitAndAnswerButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFontColorsAndImagesOnButtonsAndLabels()
        resetRandomNumbersInNumbersAndOperandLabel()
    }
    
    func setFontColorsAndImagesOnButtonsAndLabels() {
        equalLabel.font = UIFont(name: Theme.current.fontForLabels, size: 60)
        userInputLabel.font = UIFont(name: Theme.current.fontForLabels, size: 40)
        quitButton.backgroundColor = Theme.current.colorOnQuitButtons
        answerButton.backgroundColor = Theme.current.colorOnStartPlayAndAnswerButtons
        numberAndOperandLabel.font = UIFont(name: Theme.current.fontForLabels, size: 40)

        
        for numPad in numPadButtons{
            numPad.setBackgroundImage(Theme.current.imagesOnNumPadButtons, for: .normal)
            numPad.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        }
        
        for quitAndAnswerBtn in quitAndAnswerButtons {
            quitAndAnswerBtn.layer.cornerRadius = 10
            quitAndAnswerBtn.layer.shadowColor = UIColor.white.cgColor
            quitAndAnswerBtn.layer.shadowRadius = 5
            quitAndAnswerBtn.layer.shadowOpacity = 2
            quitAndAnswerBtn.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        }
    }
    
    @IBAction func buttonsWithAnimation(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(6.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
                        sender.transform = CGAffineTransform.identity }, completion: { Void in() })
    }
    
    func buttonEnable() {
        for buttonEnable in numPadButtons {
            buttonEnable.isEnabled = true
        }
        quitButton.isEnabled = true
        answerButton.isEnabled = true
    }
    
    func buttonDisable() {
        for buttonDisable in numPadButtons {
            buttonDisable.isEnabled = false
        }
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
    
    func setFirstAndSecondNumbersRandomNumbers() {
        firstNumber = randomNumbers()
        secondNumber = randomNumbers()
        
        if operand == "+" {
            while firstNumber == 0 || secondNumber == 0 {
                firstNumber = randomNumbers()
                secondNumber = randomNumbers()
            }
        }
        if operand == "-" {
            while firstNumber == 0 || secondNumber == 0 {
                firstNumber = randomNumbers()
                secondNumber = randomNumbers()
            }
            
        }
        if operand == "/"  {
            while firstNumber == 0 || secondNumber == 0 || firstNumber % secondNumber != 0 {
                firstNumber = randomNumbers()
                secondNumber = randomNumbers()
            }
        }
    }
    
    func resetRandomNumbersInNumbersAndOperandLabel() {
        if addition == true {
            operand = "+"
        }
        if subtraction == true {
            operand = "-"
            if firstNumber < secondNumber {
                let temp = firstNumber
                firstNumber = secondNumber
                secondNumber = temp
            }
        }
        if multiplication == true {
            operand = "*"
            firstNumber = numberFromSenderTag
        }
        if division == true {
            operand = "/"
            if firstNumber < secondNumber {
                let temp = firstNumber
                firstNumber = secondNumber
                secondNumber = temp
            }
        }
        setFirstAndSecondNumbersRandomNumbers()
        numberAndOperandLabel.text! = "\(firstNumber)  \(operand)  \(secondNumber)"
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
