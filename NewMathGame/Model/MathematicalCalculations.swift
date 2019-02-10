//
//  MathematicalCalculationsViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-25.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

    var correctAnswer: Double = 0
    
    
    func mathematicalCalculations(firstNumber: Double, secondNumber: Double, operand: String) -> Double{
        
        switch operand {
        case "+":
            correctAnswer = Double(firstNumber + secondNumber)
            break
        case "-":
            correctAnswer = Double(firstNumber - secondNumber)
            
            break
        case "*":
            correctAnswer = Double(firstNumber * secondNumber)
            
            break
        case "/":
            
            correctAnswer = Double(firstNumber / secondNumber)
            
            break
        default:
            break
        }
        return correctAnswer
    }
