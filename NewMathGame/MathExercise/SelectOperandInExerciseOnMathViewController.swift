//
//  TrainOnMathViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-29.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class SelectOperandInExerciseOnMathViewController: ColorViewController {
    private let goToExerciseOnMath = SelectDifficultyLevelPopupViewController()
    
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var choosOperandButtons: [UIButton]!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theme()
        questionLabel.numberOfLines = 2
        
    }
    
    func theme() {
        questionLabel.font = UIFont(name: Theme.current.fontForLabels, size: 30)
        backButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 40)
        backButton.setTitleColor(Theme.current.textColor, for: .normal)
        
        for operandButtons in choosOperandButtons {
            operandButtons.layer.cornerRadius = 10
            operandButtons.layer.shadowColor = UIColor.white.cgColor
            operandButtons.layer.shadowRadius = 5
            operandButtons.layer.shadowOpacity = 2
            operandButtons.backgroundColor = Theme.current.colorOnButtons
            operandButtons.setTitleColor(Theme.current.textColor, for: .normal)
            operandButtons.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
            operandButtons.backgroundColor = Theme.current.colorOnButtons
            operandButtons.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 20)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "additionSegue" {
            let destination = segue.destination as! ExerciseOnMathViewController
            destination.addition = additionButton.isEnabled
        }
        else if segue.identifier == "subtractionSegue" {
            let destination = segue.destination as! ExerciseOnMathViewController
            destination.subtraction = subtractionButton.isEnabled
        }
        else if segue.identifier == "multiplicationSegue" {
            let destination = segue.destination as! ExerciseOnMathViewController
            destination.multiplication = multiplicationButton.isEnabled
        }
        else if segue.identifier == "divisionSegue" {
            let destination = segue.destination as! ExerciseOnMathViewController
            destination.division = divisionButton.isEnabled
        }
    }
    
    func selectDifficultyLevelPopup() {
        let popup = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpIdPickerView") as! SelectDifficultyLevelPopupViewController
        self.addChild(popup)
        popup.view.frame = self.view.frame
        self.view.addSubview(popup.view)
        popup.didMove(toParent: self)
    }
    
}
