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
                numButtons.layer.cornerRadius = 10
                numButtons.layer.shadowColor = UIColor.gray.cgColor
                numButtons.layer.shadowRadius = 5
                numButtons.layer.shadowOpacity = 2
                numButtons.backgroundColor = Theme.current.colorOnButtons
                numButtons.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        numButtons.backgroundColor = Theme.current.colorOnButtons
        numButtons.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
        }
    }
    
    @IBAction func tableButtonsWithAnimation(_ sender: UIButton) {
        currentTagNumber = Int(sender.tag)
        performSegue(withIdentifier: "multiplicationSegue", sender: self)
        
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
        if segue.identifier == "multiplicationSegue" {
            let destination = segue.destination as! TrainOnMathViewController
            destination.numberFromSenderTag = currentTagNumber
            destination.multiplication = true
        }
    }
}
