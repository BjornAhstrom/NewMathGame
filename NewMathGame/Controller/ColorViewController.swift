//
//  ColorViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-11.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGradientBackground()
        
    }
        @objc func setGradientBackground() {
            let gradientKey: String = "GradientKey"
            
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [Theme.current.backGroundColorTop.cgColor, Theme.current.backGroundColorMiddle.cgColor, Theme.current.backGroundColorBottom.cgColor]
            gradientLayer.locations = [0.0, 0.5, 1.0]
            gradientLayer.frame = self.view.bounds
            gradientLayer.name = gradientKey
    
            if let sublayers = view.layer.sublayers {
                for layer in sublayers {
                    if layer.name == gradientKey {
                        layer.removeFromSuperlayer()
                    }
                }
            
            }
            self.view.layer.insertSublayer(gradientLayer, at: 0)
    
        }
}
