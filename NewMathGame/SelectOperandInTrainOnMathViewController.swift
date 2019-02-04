//
//  TrainOnMathViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-29.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class SelectOperandInTrainOnMathViewController: UIViewController {
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        questionLabel.numberOfLines = 2

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
