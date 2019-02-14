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
        applayTheme()
        
        settingsLabel.font = UIFont(name: Theme.current.fontForLabels, size: 30)
        themeChangeLabel.font = UIFont(name: Theme.current.fontForLabels, size: 18)
        themeChangeLabel.text = "Blu theme"
    }

    @IBAction func themeChange(_ sender: UISwitch) {
        Theme.current = sender.isOn ? BlueColorTheme() : GrayColorTheme()
        UserDefaults.standard.set(sender.isOn, forKey: "BlueTheme")
        themeChangeLabel.text = "Gray theme"
        applayTheme()
    }
    
//    @IBAction func menuButton(_ sender: UIButton) {
//        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
//        
//        UIView.animate(withDuration: 2.0,
//                       delay: 0,
//                       usingSpringWithDamping: CGFloat(0.20),
//                       initialSpringVelocity: CGFloat(6.0),
//                       options: UIView.AnimationOptions.allowUserInteraction,
//                       animations: {
//                        sender.transform = CGAffineTransform.identity }, completion: { Void in() })
//    }
    
    
    fileprivate func applayTheme() {
        setGradientBackground()
    }
    
    @objc func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Theme.current.backGroundColorTop.cgColor, Theme.current.backGroundColorMiddle.cgColor, Theme.current.backGroundColorBottom.cgColor]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
