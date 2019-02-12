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

class GameViewController: ColorViewController {
    private var correctAnswer: Double = 0
    private var tempAnswer: Double = 0
    private var firstNumber: Int = 0
    private var secondNumber: Int = 0
    private var increaseScore: Int = 0
    private var timer = Timer()
    private var startGameTimer = Timer()
    private var seconds: Int = 0
    private var arrayOfOperands = [String]()
    private var answer: Double = 0
    private var stopTimer: Bool = false
    private var startGameSecond: Int = 4
    
    public var valueFromPickerView: Int = 0
    public var name: String?
    public var operand: String = ""
    //public var startGameTimer: Bool = false
    public var addition: Bool = false
    public var subtraction: Bool = false
    public var multiplication: Bool = false
    public var division: Bool = false
    
    @IBOutlet weak var startGameTimerLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var showNumbersAndOperandLabel: UILabel!
    @IBOutlet weak var equalLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
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
    @IBOutlet weak var quitButton: RoundButton!
    @IBOutlet weak var answerButton: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontOnButtons()
        
        if valueFromPickerView == 0 {
            seconds += 30
        }
        if valueFromPickerView == 1 {
            seconds += 45
        }
        if valueFromPickerView == 2 {
             seconds += 60
        }
        
        timerLabel.font = UIFont(name: Theme.current.fontForLabels, size: 45)
        timerLabel.text! = "\(NSLocalizedString("seconds", comment: "")) \(seconds)"
        
        buttonDisable()
        runStartGameTimer()
        resetRandomNumbersInNumbersAndOperandLabel()
    }
    
    func fontOnButtons() {
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
        showNumbersAndOperandLabel.isHidden = false
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
        showNumbersAndOperandLabel.isHidden = true
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
        print("Quit button is pressed, Timer is stopped")
    }
    
//    func ifAnswerIsRight() {
//        mathematicalCalculations()
//        answerLabel.text! = ""
//        resetRandomNumbersInNumbersAndOperandLabel()
//    }
    
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
        
        answerLabel.font = UIFont(name: Theme.current.fontForLabels, size: 40)
        equalLabel.font = UIFont(name: Theme.current.fontForLabels, size: 60)
        
        if let names = name {
            nameLabel.font = UIFont(name: Theme.current.fontForLabels, size: 30)
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
        
        if addition != true && subtraction != true && multiplication != true && division != true || name == "" {
            
            let alertMessage = UIAlertView(title: "\(NSLocalizedString("alert_title", comment: ""))", message: "\(NSLocalizedString("alert_message", comment: ""))",delegate: nil, cancelButtonTitle: "\(NSLocalizedString("alert_button", comment: ""))")
            alertMessage.show()
            stopingTimer()
            
            let selectGameView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "selectGameID") as! SelectGameViewController
            self.addChild(selectGameView)
            selectGameView.view.frame = self.view.frame
            self.view.addSubview(selectGameView.view)
            selectGameView.didMove(toParent: self)
            
            if addition == true {
                selectGameView.additionButton.isSelected = true
            }
            if subtraction == true {
                selectGameView.subtractionButton.isSelected = true
            }
            if multiplication == true {
                selectGameView.multiplicationButton.isSelected = true
            }
            if division == true {
                selectGameView.divisionButton.isSelected = true
            }
            if name != "" {
                selectGameView.writeNameTextField.text = name!
            }
        }
        
        if let operandShuffle = arrayOfOperands.randomItem() {
            operand = operandShuffle
        }
        
        scoreLabel.font = UIFont(name: Theme.current.fontForLabels, size: 30)
        scoreLabel.text! = "\(NSLocalizedString("points", comment: "")) \(increaseScore)"
        showNumbersAndOperandLabel.font = UIFont(name: Theme.current.fontForLabels, size: 40)
        showNumbersAndOperandLabel.text! = "\(firstNumber)  \(operand)  \(secondNumber)"
    }
    
    func mathematicalCalculations() {
        if let ans = Double(answerLabel.text!) {
            answer = ans
            answer = Double(round(100*ans)/100)
        }
        
        tempAnswer = NewMathGame.mathematicalCalculations(firstNumber: Double(firstNumber), secondNumber: Double(secondNumber), operand: operand)
        correctAnswer = Double(round(100*tempAnswer)/100)
        
        if correctAnswer == answer {
            increaseScore += 1
        } else {
            showPopupWithWrongAnswer()
        }
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
        
        //HighScoreList.add(name: name!, score: increaseScore)
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
    
    func runStartGameTimer() {
        startGameTimer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(GameViewController.updateStartGameTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateStartGameTimer() {
        if startGameSecond < 1 {
            startGameTimer.invalidate()
            startGameTimerLabel.isHidden = true
            buttonEnable()
            runTimer()
        } else {
            startGameSecond -= 1
            startGameTimerLabel.font = UIFont(name: Theme.current.fontForLabels, size: 200)
            startGameTimerLabel.text! = "\(startGameSecond)"
        }
    }
    
    @objc func updateTimer() {
            if seconds < 1 {
                timer.invalidate()
                //Send alert to indicate "time's up!"
                print("timer stopped when times ran out")
                showPopupForFinalScore()
            } else {
                seconds -= 1
                timerLabel.font = UIFont(name: Theme.current.fontForLabels, size: 45)
                timerLabel.text! = "\(NSLocalizedString("seconds", comment: "")) \(seconds)"

            }
        }
    
    
    func stopingTimer() {
        if self.stopTimer == false {
            timer.invalidate()
            self.stopTimer = true
        }
    }
}
