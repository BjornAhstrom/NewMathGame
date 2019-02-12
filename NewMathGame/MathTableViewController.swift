//
//  MathTableViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-07.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class MathTableViewController: ColorViewController {
    let test = TrainOnMathViewController()
    var currentTagNumber: Int = 0

    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var buttonOne: RoundButton!
    @IBOutlet weak var buttonTwo: RoundButton!
    @IBOutlet weak var buttonThree: RoundButton!
    @IBOutlet weak var buttonFour: RoundButton!
    @IBOutlet weak var buttonFive: RoundButton!
    @IBOutlet weak var buttonSix: RoundButton!
    @IBOutlet weak var buttonSeven: RoundButton!
    @IBOutlet weak var buttonEight: RoundButton!
    @IBOutlet weak var buttonNine: RoundButton!
     @IBOutlet weak var buttonTen: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontOnButtons()
        
        topLabel.font = UIFont(name: Theme.current.fontForLabels, size: 35)
        topLabel.numberOfLines = 2
    }
    
    func fontOnButtons() {
        buttonOne.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        buttonOne.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonTwo.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        buttonTwo.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonThree.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        buttonThree.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonFour.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        buttonFour.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonFive.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        buttonFive.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonSix.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        buttonSix.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonSeven.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        buttonSeven.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonEight.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        buttonEight.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonNine.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        buttonNine.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        buttonTen.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        buttonTen.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
    }
    
    @IBAction func tableButtons(_ sender: UIButton) {
        currentTagNumber = Int(sender.tag)
        performSegue(withIdentifier: "multiplicationSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "multiplicationSegue" {
            let destination = segue.destination as! TrainOnMathViewController
            destination.numberFromSenderTag = currentTagNumber
            destination.multiplication = true
        }
    }
}
