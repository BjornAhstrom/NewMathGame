//
//  SideMenuViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-11.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {
 @IBOutlet weak var themeChangeLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //applayTheme()
        settingsLabel.font = UIFont(name: Theme.current.fontForLabels, size: 30)
        themeChangeLabel.font = UIFont(name: Theme.current.fontForLabels, size: 25)
        themeChangeLabel.text = "Blu color"
    }

    @IBAction func themeChange(_ sender: UISwitch) {
        if sender.isOn {
            Theme.current = BlueColorTheme()
            themeChangeLabel.text = "Blu theme"
            setGradientBackground()
        }
        if !sender.isOn {
            Theme.current = GrayColorTheme()
            themeChangeLabel.text = "Gray theme"
            setGradientBackground()
        }
        
    }
    
    func applayTheme() {
        setGradientBackground()
    }

    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Theme.current.backGroundColorTop.cgColor, Theme.current.backGroundColorMiddle.cgColor, Theme.current.backGroundColorBottom.cgColor]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
