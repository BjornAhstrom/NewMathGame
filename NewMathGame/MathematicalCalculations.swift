//
//  MathematicalCalculationsViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-25.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class MathematicalCalculations: UIViewController {
    let gameView = GameViewController()
    
    var increaseScore: Int = 0
    var correctAnswer: Double = 0
    
    
    func mathematicalCalculations(firstNumber: Double, secondNumber: Double, answer: Double ,operand: String){
        let choosOperand = operand
        
        switch choosOperand {
        case "+":
            correctAnswer = Double(firstNumber + secondNumber)
            
            if correctAnswer == answer {
                increaseScore += 1
            } else {
                gameView.showPopupWithWrongAnswer()
            }
            break
        case "-":
            correctAnswer = Double(firstNumber - secondNumber)
            if correctAnswer == answer {
                increaseScore += 1
            } else {
                gameView.showPopupWithWrongAnswer()
            }
            break
        case "*":
            correctAnswer = Double(firstNumber * secondNumber)
            if correctAnswer == answer {
                increaseScore += 1
            } else {
                gameView.showPopupWithWrongAnswer()
            }
            break
        case "/":
            
            correctAnswer = Double(firstNumber / secondNumber)
            if correctAnswer == answer {
                increaseScore += 1
            } else {
                gameView.showPopupWithWrongAnswer()
            }
            break
        default:
            break
        }
    }
}
