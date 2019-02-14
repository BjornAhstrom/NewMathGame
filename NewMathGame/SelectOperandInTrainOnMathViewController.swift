//
//  TrainOnMathViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-29.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class SelectOperandInTrainOnMathViewController: ColorViewController {
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var choosOperandButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontAndImagesButtons()
        questionLabel.font = UIFont(name: Theme.current.fontForLabels, size: 30)
        questionLabel.numberOfLines = 2
    }
    
    func fontAndImagesButtons() {
        for operandButtons in choosOperandButtons {
            operandButtons.layer.cornerRadius = 10
            operandButtons.layer.shadowColor = UIColor.gray.cgColor
            operandButtons.layer.shadowRadius = 5
            operandButtons.layer.shadowOpacity = 2
            operandButtons.backgroundColor = Theme.current.colorOnButtons
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
            let destination = segue.destination as! TrainOnMathViewController
            destination.addition = additionButton.isEnabled
        }
        else if segue.identifier == "subtractionSegue" {
            let destination = segue.destination as! TrainOnMathViewController
            destination.subtraction = subtractionButton.isEnabled
        }
        else if segue.identifier == "multiplicationSegue" {
            let destination = segue.destination as! TrainOnMathViewController
            destination.multiplication = multiplicationButton.isEnabled
        }
        else if segue.identifier == "divisionSegue" {
            let destination = segue.destination as! TrainOnMathViewController
            destination.division = divisionButton.isEnabled
        }
    }
}
