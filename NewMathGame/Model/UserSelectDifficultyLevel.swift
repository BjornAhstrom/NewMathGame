//
//  UserSelectDifficultyLevel.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-20.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import Foundation



func userSelectedDifficultyLevelInPickerView(valueFromPickerView: Int, operand: String) -> Int {
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    
    switch valueFromPickerView {
    case 0:
        firstNumber = easyRandomNumber()
        secondNumber = easyRandomNumber()
        
        if operand == "+" || operand == "-" {
            while firstNumber == 0 || secondNumber == 0 {
                firstNumber = easyRandomNumber()
                secondNumber = easyRandomNumber()
            }
        }
        if operand == "/"  {
            while firstNumber == 0 || secondNumber == 0 || firstNumber % secondNumber != 0 {
                firstNumber = easyRandomNumber()
                secondNumber = easyRandomNumber()
            }
        }
        break
    case 1:
        firstNumber = mediumRandomNumber()
        secondNumber = mediumRandomNumber()
        
        if operand == "+" || operand == "-" {
            while firstNumber == 0 || secondNumber == 0 {
                firstNumber = easyRandomNumber()
                secondNumber = easyRandomNumber()
            }
        }
        if operand == "/"   {
            while firstNumber == 0 || secondNumber == 0 || firstNumber % secondNumber != 0 {
                firstNumber = easyRandomNumber()
                secondNumber = easyRandomNumber()
            }
        }
        break
    case 2:
        firstNumber = difficultRandomNumber()
        secondNumber = difficultRandomNumber()
        
        if operand == "+" || operand == "-" {
            while firstNumber == 0 || secondNumber == 0 {
                firstNumber = easyRandomNumber()
                secondNumber = easyRandomNumber()
            }
        }
        if operand == "/"   {
            while firstNumber == 0 || secondNumber == 0 || firstNumber % secondNumber != 0 {
                firstNumber = easyRandomNumber()
                secondNumber = easyRandomNumber()
            }
        }
        break
    default:
        print("Error")
    }
    
    return firstNumber & secondNumber
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
