//
//  ColorViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-11.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Theme.current.backGroundColorTop.cgColor, Theme.current.backGroundColorMiddle.cgColor, Theme.current.backGroundColorBottom.cgColor]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
