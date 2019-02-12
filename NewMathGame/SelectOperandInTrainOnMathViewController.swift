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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontAndImagesButtons()
        questionLabel.font = UIFont(name: Theme.current.fontForLabels, size: 30)
        questionLabel.numberOfLines = 2
    }
    
    func fontAndImagesButtons() {
        additionButton.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        additionButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 20)
        subtractionButton.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        subtractionButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 20)
        multiplicationButton.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        multiplicationButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 20)
        divisionButton.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        divisionButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 20)
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
