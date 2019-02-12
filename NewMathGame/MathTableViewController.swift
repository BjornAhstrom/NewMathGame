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
    @IBOutlet var mathNumberButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontAndImagesOnButtons()
        
        topLabel.font = UIFont(name: Theme.current.fontForLabels, size: 35)
        topLabel.numberOfLines = 2
    }
    
    func fontAndImagesOnButtons() {
        for numButtons in mathNumberButtons {
        numButtons.setBackgroundImage(Theme.current.imagesOnButtons, for: .normal)
        numButtons.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        }
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
