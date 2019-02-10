//
//  MathTableViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-07.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class MathTableViewController: UIViewController {
    let test = TrainOnMathViewController()
    var currentTagNumber: Int = 0

    @IBOutlet weak var topLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientBackground()
        
        topLabel.font = UIFont(name: "Marker Felt", size: 35)
        topLabel.numberOfLines = 2
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